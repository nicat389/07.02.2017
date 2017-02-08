--
-- Database: `tourism`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `fullName` varchar(50) NOT NULL,
  `age` int(3) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `tourPacket` varchar(20) DEFAULT NULL,
  `tourPay` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `fullName`, `age`, `phone`, `tourPacket`, `tourPay`) VALUES
(1, 'Celil Dadasov Mehdi', 20, '+99451-442-79-53', 'Baku-Moscow', 350),
(2, 'Merdanli Nicat Mehemmed', 19, '+994702656526', 'Baku-Tbilisi', 240);

-- --------------------------------------------------------

--
-- Table structure for table `employe`
--

CREATE TABLE `employe` (
  `id` int(11) NOT NULL,
  `fullName` varchar(50) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(15) DEFAULT NULL,
  `job` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employe`
--

INSERT INTO `employe` (`id`, `fullName`, `phone`, `email`, `job`) VALUES
(1, 'Memmedov Hikmet Elbrus', '+994507282444', 'hikmatmammadov@', 'Economic'),
(2, 'Memmedov Samir Kerim', '+994703123101', 'samir_m@gmail.c', 'Finance');

-- --------------------------------------------------------

--
-- Table structure for table `employee_client`
--

CREATE TABLE `employee_client` (
  `id` int(11) NOT NULL,
  `employee` varchar(50) NOT NULL,
  `client` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_client`
--

INSERT INTO `employee_client` (`id`, `employee`, `client`) VALUES
(1, 'Memmedov Hikmet Elbrus', 'Merdanli Nicat Mehemmed');

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `job` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id`, `job`) VALUES
(1, 'Economic'),
(2, 'Finance');

-- --------------------------------------------------------

--
-- Table structure for table `tour`
--

CREATE TABLE `tour` (
  `id` int(11) NOT NULL,
  `tourName` varchar(20) NOT NULL,
  `price` int(4) NOT NULL,
  `tourDate` date DEFAULT NULL,
  `tourPlace` varchar(15) DEFAULT NULL,
  `clientNumbers` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tour`
--

INSERT INTO `tour` (`id`, `tourName`, `price`, `tourDate`, `tourPlace`, `clientNumbers`) VALUES
(1, 'Baku-Moscow', 350, '0000-00-00', 'Moscow', 5),
(2, 'Baku-Tbilisi', 240, '0000-00-00', 'Tbilisi', 50);

-- --------------------------------------------------------

--
-- Table structure for table `tourplace`
--

CREATE TABLE `tourplace` (
  `id` int(11) NOT NULL,
  `place` varchar(20) NOT NULL,
  `price` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tourplace`
--

INSERT INTO `tourplace` (`id`, `place`, `price`) VALUES
(1, 'Moscow', 350),
(2, 'Tbilisi', 240);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `c_index` (`fullName`,`tourPacket`,`tourPay`),
  ADD KEY `c1` (`id`),
  ADD KEY `oi_i` (`tourPacket`),
  ADD KEY `i_i` (`tourPay`);

--
-- Indexes for table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `e_index` (`job`),
  ADD KEY `fullName` (`fullName`);

--
-- Indexes for table `employee_client`
--
ALTER TABLE `employee_client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_index` (`employee`,`client`),
  ADD KEY `k_a1a` (`client`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `j_index` (`job`);

--
-- Indexes for table `tour`
--
ALTER TABLE `tour`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_index` (`tourName`,`price`,`tourPlace`),
  ADD KEY `a` (`tourPlace`),
  ADD KEY `k_a` (`price`);

--
-- Indexes for table `tourplace`
--
ALTER TABLE `tourplace`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tp_index` (`place`,`price`),
  ADD KEY `aa` (`place`),
  ADD KEY `aaa` (`price`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `employe`
--
ALTER TABLE `employe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `employee_client`
--
ALTER TABLE `employee_client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tour`
--
ALTER TABLE `tour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tourplace`
--
ALTER TABLE `tourplace`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `i_i` FOREIGN KEY (`tourPay`) REFERENCES `tour` (`price`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `oi_i` FOREIGN KEY (`tourPacket`) REFERENCES `tour` (`tourName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `employe1` FOREIGN KEY (`job`) REFERENCES `job` (`job`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_client`
--
ALTER TABLE `employee_client`
  ADD CONSTRAINT `k_a1a` FOREIGN KEY (`client`) REFERENCES `client` (`fullName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `k_aa` FOREIGN KEY (`employee`) REFERENCES `employe` (`fullName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tour`
--
ALTER TABLE `tour`
  ADD CONSTRAINT `k_a` FOREIGN KEY (`price`) REFERENCES `tourplace` (`price`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `t_c` FOREIGN KEY (`tourPlace`) REFERENCES `tourplace` (`place`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
