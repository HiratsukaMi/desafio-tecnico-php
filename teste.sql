-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 26-Maio-2019 às 19:52
-- Versão do servidor: 8.0.16-commercial
-- versão do PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `teste`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `bairro`
--

CREATE TABLE `bairro` (
  `idBai` int(10) UNSIGNED NOT NULL,
  `nameBai` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `bairro`
--

INSERT INTO `bairro` (`idBai`, `nameBai`) VALUES
(1, 'a');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cadastroempresa`
--

CREATE TABLE `cadastroempresa` (
  `idEmp` int(10) UNSIGNED NOT NULL,
  `nameEmp` varchar(45) NOT NULL,
  `cnpjEmp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cadastroempresa`
--

INSERT INTO `cadastroempresa` (`idEmp`, `nameEmp`, `cnpjEmp`) VALUES
(1, 'Fukurodani', 'xx.xxx.xxx/xxxx-xx'),
(2, 'Seijoh', 'yy.yyy.yyy/yyyy-yy'),
(3, 'Nekoma', 'zz.zzz.zzz/zzzz-zz'),
(4, 'Karasuno', 'aa.aaa.aaa/aaaa-aa'),
(5, 'Shiratorizawa', 'bb.bbb.bbb/bbbb-bb'),
(6, 'Dateko', 'cc.ccc.ccc/cccc-cc');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cadastrousuario`
--

CREATE TABLE `cadastrousuario` (
  `idUser` int(10) UNSIGNED NOT NULL,
  `nameUser` varchar(60) NOT NULL,
  `rgUser` varchar(15) NOT NULL,
  `cpfUser` varchar(15) NOT NULL,
  `dataNasc` varchar(11) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `CadastroEmpresa_idEmp` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cadastrousuario`
--

INSERT INTO `cadastrousuario` (`idUser`, `nameUser`, `rgUser`, `cpfUser`, `dataNasc`, `senha`, `CadastroEmpresa_idEmp`) VALUES
(1, 'Koutarou', '00.000.000-0', '000.000.000-00', '00/00/0000', '1234', 1),
(2, 'Keiji', '11.111.111-1', '111.111.111-11', '11/11/1111', '5678', 1),
(3, 'Tooru', '22.222.222-2', '222.222.222-22', '22/22/2222', '1234', 2),
(4, 'Hajime', '33.333.333-3', '333.333.333-33', '33/33/3333', '5678', 2),
(5, 'Kenma', '44.444.444-4', '444.444.444-44', '44/44/4444', '1234', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE `cidade` (
  `idCity` int(10) UNSIGNED NOT NULL,
  `nameCity` varchar(40) NOT NULL,
  `idState` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `email`
--

CREATE TABLE `email` (
  `idEmail` int(10) UNSIGNED NOT NULL,
  `email` varchar(60) NOT NULL,
  `idEmp` int(10) UNSIGNED DEFAULT NULL,
  `idUser` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `email`
--

INSERT INTO `email` (`idEmail`, `email`, `idEmp`, `idUser`) VALUES
(1, 'koutarou@fukurodani.com', NULL, 1),
(2, 'user2@example.com', 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `idEnd` int(10) UNSIGNED NOT NULL,
  `nameEnd` varchar(60) NOT NULL,
  `cepEnd` varchar(10) NOT NULL,
  `idCity` int(10) UNSIGNED NOT NULL,
  `idBai` int(10) UNSIGNED NOT NULL,
  `idEmp` int(10) UNSIGNED NOT NULL,
  `idUser` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `idState` int(10) UNSIGNED NOT NULL,
  `siglaState` char(2) NOT NULL,
  `nameState` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `login`
--

CREATE TABLE `login` (
  `idLog` int(10) UNSIGNED NOT NULL,
  `idUser` int(10) UNSIGNED NOT NULL,
  `idEmail` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `login`
--

INSERT INTO `login` (`idLog`, `idUser`, `idEmail`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone`
--

CREATE TABLE `telefone` (
  `idTel` int(10) UNSIGNED NOT NULL,
  `tel` varchar(15) NOT NULL,
  `idEmp` int(10) UNSIGNED NOT NULL,
  `idUser` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bairro`
--
ALTER TABLE `bairro`
  ADD PRIMARY KEY (`idBai`);

--
-- Indexes for table `cadastroempresa`
--
ALTER TABLE `cadastroempresa`
  ADD PRIMARY KEY (`idEmp`);

--
-- Indexes for table `cadastrousuario`
--
ALTER TABLE `cadastrousuario`
  ADD PRIMARY KEY (`idUser`),
  ADD KEY `fk_CadastroUsuario_CadastroEmpresa1_idx` (`CadastroEmpresa_idEmp`);

--
-- Indexes for table `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`idCity`),
  ADD KEY `fk_Cidade_Estado1_idx` (`idState`);

--
-- Indexes for table `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`idEmail`),
  ADD KEY `fk_Email_CadastroEmpresa1_idx` (`idEmp`),
  ADD KEY `fk_Email_CadastroUsuario1_idx` (`idUser`);

--
-- Indexes for table `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`idEnd`),
  ADD KEY `fk_Endereco_Cidade_idx` (`idCity`),
  ADD KEY `fk_Endereco_Bairro1_idx` (`idBai`),
  ADD KEY `fk_Endereco_CadastroEmpresa1_idx` (`idEmp`),
  ADD KEY `fk_Endereco_CadastroUsuario1_idx` (`idUser`);

--
-- Indexes for table `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`idState`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`idLog`),
  ADD KEY `fk_Login_CadastroUsuario1_idx` (`idUser`),
  ADD KEY `fk_Login_Email1_idx` (`idEmail`);

--
-- Indexes for table `telefone`
--
ALTER TABLE `telefone`
  ADD PRIMARY KEY (`idTel`),
  ADD KEY `fk_Telefone_CadastroEmpresa1_idx` (`idEmp`),
  ADD KEY `fk_Telefone_CadastroUsuario1_idx` (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bairro`
--
ALTER TABLE `bairro`
  MODIFY `idBai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cadastroempresa`
--
ALTER TABLE `cadastroempresa`
  MODIFY `idEmp` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cadastrousuario`
--
ALTER TABLE `cadastrousuario`
  MODIFY `idUser` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cidade`
--
ALTER TABLE `cidade`
  MODIFY `idCity` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email`
--
ALTER TABLE `email`
  MODIFY `idEmail` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `endereco`
--
ALTER TABLE `endereco`
  MODIFY `idEnd` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estado`
--
ALTER TABLE `estado`
  MODIFY `idState` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `idLog` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `telefone`
--
ALTER TABLE `telefone`
  MODIFY `idTel` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `cadastrousuario`
--
ALTER TABLE `cadastrousuario`
  ADD CONSTRAINT `fk_CadastroUsuario_CadastroEmpresa1` FOREIGN KEY (`CadastroEmpresa_idEmp`) REFERENCES `cadastroempresa` (`idEmp`);

--
-- Limitadores para a tabela `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `fk_Cidade_Estado1` FOREIGN KEY (`idState`) REFERENCES `estado` (`idState`);

--
-- Limitadores para a tabela `email`
--
ALTER TABLE `email`
  ADD CONSTRAINT `fk_Email_CadastroEmpresa1` FOREIGN KEY (`idEmp`) REFERENCES `cadastroempresa` (`idEmp`),
  ADD CONSTRAINT `fk_Email_CadastroUsuario1` FOREIGN KEY (`idUser`) REFERENCES `cadastrousuario` (`idUser`);

--
-- Limitadores para a tabela `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `fk_Endereco_Bairro1` FOREIGN KEY (`idBai`) REFERENCES `bairro` (`idBai`),
  ADD CONSTRAINT `fk_Endereco_CadastroEmpresa1` FOREIGN KEY (`idEmp`) REFERENCES `cadastroempresa` (`idEmp`),
  ADD CONSTRAINT `fk_Endereco_CadastroUsuario1` FOREIGN KEY (`idUser`) REFERENCES `cadastrousuario` (`idUser`),
  ADD CONSTRAINT `fk_Endereco_Cidade` FOREIGN KEY (`idCity`) REFERENCES `cidade` (`idCity`);

--
-- Limitadores para a tabela `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `fk_Login_CadastroUsuario1` FOREIGN KEY (`idUser`) REFERENCES `cadastrousuario` (`idUser`),
  ADD CONSTRAINT `fk_Login_Email1` FOREIGN KEY (`idEmail`) REFERENCES `email` (`idEmail`);

--
-- Limitadores para a tabela `telefone`
--
ALTER TABLE `telefone`
  ADD CONSTRAINT `fk_Telefone_CadastroEmpresa1` FOREIGN KEY (`idEmp`) REFERENCES `cadastroempresa` (`idEmp`),
  ADD CONSTRAINT `fk_Telefone_CadastroUsuario1` FOREIGN KEY (`idUser`) REFERENCES `cadastrousuario` (`idUser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
