-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 18, 2016 at 01:40 AM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `registrator_db`
--

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `building`, `city`, `district`, `flat`, `postcode`, `region`, `street`, `user_id`) VALUES
(2, '17', 'Хмельницький', 'Семенівський', '17а', '29000', 'Хмельницька', 'Героїв Майдану', 2),
(3, '30к', 'Стрий', 'Стрийський', '0', '353567', 'Львівська', 'Героїв Майдану', 3),
(4, '45', 'Львів', 'Залізничний', '78', '79026', 'Львівська', 'Стрийська', 4),
(5, '34', 'Київ', 'Троєщина', '90', '4456767', 'Київська', 'Бандери', 5),
(6, '43', 'Львів', 'Троєщина', '43', '34345', 'Киівська', 'Стрийська', 6);

--
-- Dumping data for table `inquiry_list`
--

INSERT INTO `inquiry_list` (`inquiry_list_id`, `date`, `inquiry_type`, `to_user_id`, `resource_id`, `from_user_id`) VALUES
(1, '2015-12-30 16:06:00', 'OUTPUT', 2, 2, 3),
(2, '2016-01-14 11:43:04', 'OUTPUT', 2, 5, 4),
(5, '2016-01-16 12:39:21', 'OUTPUT', 2, 4, 4),
(14, '2016-01-17 17:32:59', 'OUTPUT', 2, 2, 3),
(17, '2015-12-08 00:00:00', 'INPUT', 2, 2, 3),
(18, '2015-12-08 00:00:00', 'INPUT', 2, 3, 3),
(19, '2016-01-03 00:00:00', 'INPUT', 2, 4, 5),
(20, '2016-01-03 00:00:00', 'INPUT', 2, 5, 3),
(21, '2016-01-03 00:00:00', 'INPUT', 4, 6, 3),
(22, '2016-01-03 00:00:00', 'INPUT', 2, 7, 5),
(23, '2016-01-04 00:00:00', 'INPUT', 4, 8, 3),
(24, '2016-01-04 00:00:00', 'INPUT', 2, 9, 3),
(25, '2016-01-04 00:00:00', 'INPUT', 4, 10, 3),
(26, '2016-01-04 00:00:00', 'INPUT', 2, 11, 6),
(27, '2016-01-04 00:00:00', 'INPUT', 4, 12, 3),
(28, '2016-01-04 00:00:00', 'INPUT', 2, 13, 5),
(29, '2016-01-05 00:00:00', 'INPUT', 4, 14, 3),
(30, '2016-01-07 00:00:00', 'INPUT', 2, 15, 5),
(33, '2016-01-18 10:22:15', 'OUTPUT', 2, 4, 3),
(34, '2016-01-18 10:25:29', 'OUTPUT', 4, 4, 3),
(35, '2016-01-18 10:26:07', 'OUTPUT', 4, 14, 3),
(36, '2016-02-18 00:00:00', 'INPUT', 2, 16, 4);

--
-- Dumping data for table `list_of_resouces`
--

INSERT INTO `list_of_resouces` (`resources_id`, `date`, `description`, `identifier`, `reason_inclusion`, `status`, `registrator_id`, `tome_id`, `resource_type_id`) VALUES
(2, '2015-12-08 15:33:01', 'радіочастоти', '123555', 'Паспорт громадянина україни...', 'ACTIVE', 2, 1, 2),
(3, '2015-12-08 15:33:01', 'суперрадіочастоти', '111111', 'Посвідчення водія ...', 'ACTIVE', 2, 1, 2),
(4, '2016-01-02 00:00:00', 'Стрийський парк', '79000-001', 'паспорт громадянина України КС 2234, виданий на ім’я Олександр Олександрович Архилюк Львівський....;\r\n', 'ACTIVE', 2, 1, 1),
(5, '2016-01-03 00:00:00', 'парк Культури', '79000-002', 'паспорт громадянина України КС 2234, виданий на ім’я Олександр Олександрович Архилюк Львівський....;\r\nволевиявлення людини;\r\nдоручення;\r\n', 'ACTIVE', 2, 1, 1),
(6, '2016-01-03 00:00:00', 'парк Залізна вода', '79000-003', 'паспорт громадянина України КС 2234, виданий на ім’я Олександр Олександрович Архилюк Львівський....;\r\nдоручення;\r\n', 'ACTIVE', 4, 2, 1),
(7, '2016-01-03 00:00:00', 'Студентський парк', '79000-004', 'волевиявлення людини;\r\nдоручення;\r\n', 'ACTIVE', 2, 1, 1),
(8, '2016-01-04 00:00:00', 'Ботанічний сад', '79000-005', 'паспорт громадянина України КС 2234, виданий на ім’я Олександр Олександрович Архилюк Львівський....;\r\nдоручення;\r\n', 'ACTIVE', 4, 2, 1),
(9, '2016-01-04 00:00:00', 'парк Горіховий гай', '79000-006', 'паспорт громадянина України КС 2234, виданий на ім’я Олександр Олександрович Архилюк Львівський....;\r\nдоручення;\r\n', 'ACTIVE', 2, 1, 1),
(10, '2016-01-04 00:00:00', 'Дендрарій', '79000-007', 'паспорт громадянина України КС 2234, виданий на ім’я Олександр Олександрович Архилюк Львівський....;\r\nдоручення;\r\n', 'ACTIVE', 4, 2, 1),
(11, '2016-01-04 00:00:00', 'парк Піскові озера', '79000-008', 'волевиявлення людини;\r\nдоручення;\r\n', 'ACTIVE', 2, 1, 1),
(12, '2016-01-04 00:00:00', 'парк Імені Франка', '79000-009', 'паспорт громадянина України КС 2234, виданий на ім’я Олександр Олександрович Архилюк Львівський....;\r\nдоручення;\r\n', 'ACTIVE', 4, 2, 1),
(13, '2016-01-04 00:00:00', 'сад Собору святого Юра', '79000-010', 'паспорт громадянина України КС 2234, виданий на ім’я Олександр Олександрович Архилюк Львівський....;\r\nдоручення;\r\n', 'ACTIVE', 2, 1, 1),
(14, '2016-01-05 00:00:00', 'Радіо 24', '79000-1-001', 'паспорт громадянина України КС 2234, виданий на ім’я Олександр Олександрович Архилюк Львівський....;\r\nдоручення;\r\n', 'ACTIVE', 4, 2, 2),
(15, '2016-01-07 00:00:00', 'парк Богданівка', '79000-011', 'паспорт громадянина України КС 2234, виданий на ім’я Олександр Олександрович Архилюк Львівський....;\r\nдоручення;\r\n', 'ACTIVE', 2, 1, 1),
(16, '2016-02-18 00:00:00', 'тестКоординат', '804:23:17:026:79000:0010', 'паспорт громадянина України КС 1122456, виданий на ім’я Василь Васильович Василюк Львівський;\r\nдоручення;\r\n', 'ACTIVE', 2, 1, 1);

--
-- Dumping data for table `passport_data`
--

INSERT INTO `passport_data` (`passport_data_id`, `comment`, `number`, `published_by_data`, `seria`, `user_id`) VALUES
(2, NULL, '123456', 'Хмельницьким', 'КК', 2),
(3, NULL, '123456', 'Стрийським', 'КК', 3),
(4, NULL, '1122456', 'Львівський', 'КС', 4),
(5, NULL, '1126789', 'Київський', 'КС', 5),
(6, NULL, '43545', 'Львівським', 'КС', 6);

--
-- Dumping data for table `polygon`
--

INSERT INTO `polygon` (`id`, `maxLat`, `maxLng`, `minLat`, `minLng`, `resource_id`, `coordinates`) VALUES
(2, 49.91754184754319, 26.249633822590113, 49.14506496754859, 24.21084593050182, 2, '[{"lat":49.91754184754319,"lng":24.21084593050182},{"lat":49.9024188855169,"lng":26.249633822590113},{"lat":49.158718087297515,"lng":26.2177737057209},{"lat":49.14506496754859,"lng":24.739013705402613}]'),
(3, 49.030305067856254, 24.964233431965113, 48.77356871983263, 24.414917025715113, 3, '[{"lat":49.022741040596344,"lng":24.524780306965113},{"lat":49.030305067856254,"lng":24.943359391763806},{"lat":48.806139908078684,"lng":24.964233431965113},{"lat":48.77356871983263,"lng":24.414917025715113}]'),
(4, 49.82776288975754, 24.0322145819664, 49.81786998450602, 24.020270705223083, 4, '[{"lat":49.824805785820764,"lng":24.02088761329651},{"lat":49.818589914319574,"lng":24.020270705223083},{"lat":49.81786998450602,"lng":24.024454951286316},{"lat":49.81819533872909,"lng":24.02509868144989},{"lat":49.81843069999485,"lng":24.025238156318665},{"lat":49.821317243571634,"lng":24.02835488319397},{"lat":49.82167718417192,"lng":24.028934240341187},{"lat":49.82184330969968,"lng":24.029427766799927},{"lat":49.822037122094414,"lng":24.02947336435318},{"lat":49.82368449610263,"lng":24.0322145819664},{"lat":49.82492345051901,"lng":24.030900299549103},{"lat":49.8252626001068,"lng":24.030782282352448},{"lat":49.825636354041386,"lng":24.030868113040924},{"lat":49.825882061073294,"lng":24.0310075879097},{"lat":49.82606547536814,"lng":24.031307995319366},{"lat":49.82619351889761,"lng":24.03167814016342},{"lat":49.82677490147095,"lng":24.031409919261932},{"lat":49.826819889116884,"lng":24.031608402729034},{"lat":49.826972154685045,"lng":24.03150513768196},{"lat":49.82717113737555,"lng":24.031507819890976},{"lat":49.82737531006801,"lng":24.03141662478447},{"lat":49.82754660683161,"lng":24.03126373887062},{"lat":49.82767637670322,"lng":24.031086713075638},{"lat":49.82776288975754,"lng":24.03091236948967},{"lat":49.82756737003446,"lng":24.03062805533409},{"lat":49.82745144203784,"lng":24.030416160821915},{"lat":49.82736492842647,"lng":24.03019353747368},{"lat":49.82731128990973,"lng":24.02993604540825},{"lat":49.82727495410652,"lng":24.029675871133804},{"lat":49.82723342744088,"lng":24.02901068329811},{"lat":49.827191900739564,"lng":24.0288282930851},{"lat":49.827127880338544,"lng":24.02867004275322},{"lat":49.82704482671908,"lng":24.028530567884445},{"lat":49.826027408307546,"lng":24.02722030878067},{"lat":49.825837072555174,"lng":24.026812613010406},{"lat":49.82576093804454,"lng":24.026539027690887},{"lat":49.82556367989134,"lng":24.025589525699615},{"lat":49.825477162903766,"lng":24.025385677814484},{"lat":49.824978822042695,"lng":24.024755358695984},{"lat":49.82492691124109,"lng":24.024548828601837},{"lat":49.82490960762818,"lng":24.024291336536407},{"lat":49.824961518448355,"lng":24.023910462856293},{"lat":49.825340465747956,"lng":24.02217909693718},{"lat":49.82533700505547,"lng":24.02177944779396},{"lat":49.82526952150219,"lng":24.02143746614456},{"lat":49.82516916117195,"lng":24.021179974079132},{"lat":49.82504111493106,"lng":24.02098685503006},{"lat":49.82490268618129,"lng":24.020890295505524}]'),
(5, 49.830536416279834, 24.02985155582428, 49.82500650778075, 24.01808202266693, 5, '[{"lat":49.830536416279834,"lng":24.019433856010437},{"lat":49.82987895088713,"lng":24.01940166950226},{"lat":49.82986510941439,"lng":24.02013123035431},{"lat":49.82824562976009,"lng":24.020013213157654},{"lat":49.828017237241085,"lng":24.019755721092224},{"lat":49.82787881700774,"lng":24.019669890403748},{"lat":49.827892659048906,"lng":24.019197821617126},{"lat":49.82768502801561,"lng":24.01910126209259},{"lat":49.8265845686597,"lng":24.01808202266693},{"lat":49.825504848356616,"lng":24.020227789878845},{"lat":49.826058554086636,"lng":24.020914435386658},{"lat":49.82594089214931,"lng":24.021772742271423},{"lat":49.825497926994885,"lng":24.021676182746887},{"lat":49.82542871332312,"lng":24.021922945976257},{"lat":49.8254217919505,"lng":24.022191166877747},{"lat":49.82500650778075,"lng":24.024240374565125},{"lat":49.82502727207392,"lng":24.02463734149933},{"lat":49.82556714056765,"lng":24.0253347158432},{"lat":49.8256709607411,"lng":24.025645852088928},{"lat":49.82575401671942,"lng":24.02607500553131},{"lat":49.82661917468109,"lng":24.02531325817108},{"lat":49.826030868950646,"lng":24.024294018745422},{"lat":49.82590628564269,"lng":24.023972153663635},{"lat":49.825850915180595,"lng":24.023521542549133},{"lat":49.82614160939948,"lng":24.021697640419006},{"lat":49.82659841107124,"lng":24.02182638645172},{"lat":49.82632156208817,"lng":24.02357518672943},{"lat":49.826397695716445,"lng":24.023939967155457},{"lat":49.82738050088793,"lng":24.025463461875916},{"lat":49.82756044896784,"lng":24.025956988334656},{"lat":49.82759505429106,"lng":24.026246666908264},{"lat":49.82824562976009,"lng":24.02662217617035},{"lat":49.82805876323385,"lng":24.028231501579285},{"lat":49.82805184223753,"lng":24.028499722480774},{"lat":49.828591676976515,"lng":24.02985155582428},{"lat":49.82902077208664,"lng":24.02984082698822},{"lat":49.82895848432297,"lng":24.02831733226776},{"lat":49.829124584847854,"lng":24.02584969997406},{"lat":49.82873701606915,"lng":24.025742411613464},{"lat":49.82929068480235,"lng":24.02256667613983},{"lat":49.829595199904176,"lng":24.022684693336487},{"lat":49.829927396010525,"lng":24.021493792533875},{"lat":49.83030111390304,"lng":24.02061402797699},{"lat":49.83012117601894,"lng":24.020442366600037}]'),
(6, 49.82140722897276, 24.040676951408386, 49.81652700988103, 24.033638834953308, 6, '[{"lat":49.82140722897276,"lng":24.036996960639954},{"lat":49.82051428950597,"lng":24.0337997674942},{"lat":49.82037584780299,"lng":24.033960700035095},{"lat":49.8202374057039,"lng":24.033638834953308},{"lat":49.81865221543448,"lng":24.035398364067078},{"lat":49.81853453548344,"lng":24.03561294078827},{"lat":49.81819533872909,"lng":24.035966992378235},{"lat":49.81730233998537,"lng":24.03654634952545},{"lat":49.81652700988103,"lng":24.03707206249237},{"lat":49.81701851522789,"lng":24.037511944770813},{"lat":49.81682468272954,"lng":24.037994742393494},{"lat":49.81706005066225,"lng":24.038209319114685},{"lat":49.81745463551039,"lng":24.039217829704285},{"lat":49.81756539559115,"lng":24.03959333896637},{"lat":49.817198501852566,"lng":24.040204882621765},{"lat":49.817655387970085,"lng":24.040676951408386},{"lat":49.81833378667112,"lng":24.039915204048157},{"lat":49.81865913777562,"lng":24.03933584690094},{"lat":49.81928906667457,"lng":24.040644764900208},{"lat":49.819579800323474,"lng":24.0403550863266},{"lat":49.82050736743022,"lng":24.03986155986786},{"lat":49.82033431521485,"lng":24.03911054134369},{"lat":49.82070118517663,"lng":24.03861701488495},{"lat":49.82084654797692,"lng":24.038016200065613},{"lat":49.820756561533,"lng":24.036954045295715},{"lat":49.82110266232434,"lng":24.03683602809906},{"lat":49.82117188218552,"lng":24.03711497783661}]'),
(7, 49.83100701759922, 24.017183482646942, 49.82569864608306, 24.010601341724396, 7, '[{"lat":49.830342637935054,"lng":24.017170071601868},{"lat":49.83033571726554,"lng":24.017009139060974},{"lat":49.8302249864184,"lng":24.016773104667664},{"lat":49.83052949563803,"lng":24.016461968421936},{"lat":49.83061946390421,"lng":24.01656925678253},{"lat":49.83100701759922,"lng":24.016000628471375},{"lat":49.83067482890792,"lng":24.015313982963562},{"lat":49.83049489241418,"lng":24.015013575553894},{"lat":49.83006581038147,"lng":24.014541506767273},{"lat":49.82917303072685,"lng":24.013307690620422},{"lat":49.828653965212546,"lng":24.012623727321625},{"lat":49.82826293217971,"lng":24.012430608272552},{"lat":49.82755352790022,"lng":24.011588394641876},{"lat":49.82735281650853,"lng":24.011910259723663},{"lat":49.82705520842929,"lng":24.01151329278946},{"lat":49.82721093381542,"lng":24.01122897863388},{"lat":49.82674721674495,"lng":24.01070863008499},{"lat":49.82659841107124,"lng":24.010601341724396},{"lat":49.82653958079489,"lng":24.01100367307663},{"lat":49.82635962891727,"lng":24.01100367307663},{"lat":49.82619351889761,"lng":24.011068046092987},{"lat":49.82577132003031,"lng":24.011416733264923},{"lat":49.82569864608306,"lng":24.01152938604355},{"lat":49.82606547536814,"lng":24.011926352977753},{"lat":49.82629733772676,"lng":24.012167751789093},{"lat":49.82728706604395,"lng":24.013369381427765},{"lat":49.827494698785486,"lng":24.013830721378326},{"lat":49.82759505429106,"lng":24.014093577861786},{"lat":49.827819988288645,"lng":24.01371270418167},{"lat":49.829017311657424,"lng":24.015155732631683},{"lat":49.829494848548315,"lng":24.01520401239395},{"lat":49.82974745673612,"lng":24.015177190303802},{"lat":49.82979936236477,"lng":24.016561210155487},{"lat":49.829660947231304,"lng":24.016550481319427},{"lat":49.82966786799738,"lng":24.01698499917984},{"lat":49.83003120682587,"lng":24.01695817708969},{"lat":49.83010041391234,"lng":24.017060101032257},{"lat":49.83010041391234,"lng":24.017183482646942}]'),
(8, 49.834083114901524, 24.03218239545822, 49.832411873711294, 24.029274880886078, 8, '[{"lat":49.834083114901524,"lng":24.031050503253937},{"lat":49.83358140259826,"lng":24.030143916606903},{"lat":49.83364022431007,"lng":24.029773771762848},{"lat":49.83319732966256,"lng":24.029274880886078},{"lat":49.832861695860984,"lng":24.0299990773201},{"lat":49.832702528501706,"lng":24.029864966869354},{"lat":49.832411873711294,"lng":24.030589163303375},{"lat":49.832975880817784,"lng":24.031533300876617},{"lat":49.833456838737106,"lng":24.03218239545822}]'),
(9, 49.81580012662576, 24.01112973690033, 49.81085703092696, 24.00186002254486, 9, '[{"lat":49.81580012662576,"lng":24.00971621274948},{"lat":49.815692823887034,"lng":24.00950700044632},{"lat":49.81510438528329,"lng":24.00923877954483},{"lat":49.81446747896643,"lng":24.00773137807846},{"lat":49.814554015642855,"lng":24.007082283496857},{"lat":49.8142355599105,"lng":24.006856977939606},{"lat":49.814249405855485,"lng":24.005564153194427},{"lat":49.81435671179478,"lng":24.00472193956375},{"lat":49.81425979031161,"lng":24.004684388637543},{"lat":49.81432901996225,"lng":24.00396555662155},{"lat":49.81419402205178,"lng":24.00403529405594},{"lat":49.81373364173027,"lng":24.003885090351105},{"lat":49.81375094934041,"lng":24.002602994441986},{"lat":49.81099549986449,"lng":24.00186002254486},{"lat":49.81085703092696,"lng":24.00516450405121},{"lat":49.81143167442836,"lng":24.00663435459137},{"lat":49.81157014172188,"lng":24.006698727607727},{"lat":49.81159091178173,"lng":24.00709569454193},{"lat":49.81122397274533,"lng":24.00709569454193},{"lat":49.81121704934054,"lng":24.008565545082092},{"lat":49.81220016290549,"lng":24.008962512016296},{"lat":49.812027080979774,"lng":24.009777903556824},{"lat":49.81280248318182,"lng":24.00984227657318},{"lat":49.813889409998446,"lng":24.009681344032288},{"lat":49.81414556117156,"lng":24.008983969688416},{"lat":49.814830931967606,"lng":24.009466767311096},{"lat":49.814941698053815,"lng":24.01014268398285},{"lat":49.81476862593268,"lng":24.01063621044159},{"lat":49.81476862593268,"lng":24.01112973690033}]'),
(10, 49.83158142182773, 24.03243988752365, 49.83047413046795, 24.030637443065643, 10, '[{"lat":49.83158142182773,"lng":24.031163156032562},{"lat":49.83121117410042,"lng":24.030637443065643},{"lat":49.83047413046795,"lng":24.031817615032196},{"lat":49.83093089122566,"lng":24.03243988752365}]'),
(11, 49.825048036358154, 23.99975448846817, 49.82262201550723, 23.995135724544525, 11, '[{"lat":49.825048036358154,"lng":23.99779111146927},{"lat":49.824712346003544,"lng":23.996562659740448},{"lat":49.82480924655124,"lng":23.996090590953827},{"lat":49.82480924655124,"lng":23.995849192142487},{"lat":49.824712346003544,"lng":23.99555414915085},{"lat":49.82463967046541,"lng":23.995436131954193},{"lat":49.82440433940222,"lng":23.995135724544525},{"lat":49.82347338618063,"lng":23.997174203395844},{"lat":49.82302347671588,"lng":23.997211754322052},{"lat":49.82270507672028,"lng":23.99800568819046},{"lat":49.82262201550723,"lng":23.999169766902924},{"lat":49.823518376897,"lng":23.99975448846817},{"lat":49.82375717307571,"lng":23.99897664785385},{"lat":49.823860997133586,"lng":23.99877279996872},{"lat":49.824058262229705,"lng":23.99853140115738},{"lat":49.824175928746136,"lng":23.998413383960724},{"lat":49.82434204569388,"lng":23.998354375362396},{"lat":49.82483693238639,"lng":23.998316824436188},{"lat":49.82483001092909,"lng":23.997941315174103}]'),
(12, 49.84057376478728, 24.022682011127472, 49.836685015214144, 24.016164243221283, 12, '[{"lat":49.84013785290865,"lng":24.021641314029694},{"lat":49.84057376478728,"lng":24.021115601062775},{"lat":49.83799629223447,"lng":24.016164243221283},{"lat":49.836923746395804,"lng":24.01846557855606},{"lat":49.836685015214144,"lng":24.019307792186737},{"lat":49.838598291410264,"lng":24.022682011127472},{"lat":49.839546251930024,"lng":24.021373093128204},{"lat":49.83955317128154,"lng":24.0212282538414},{"lat":49.839684638772425,"lng":24.02101904153824},{"lat":49.83974345306053,"lng":24.021094143390656},{"lat":49.839791888302884,"lng":24.021029770374298}]'),
(13, 49.83994065338674, 24.01673823595047, 49.83790287789755, 24.013315737247467, 13, '[{"lat":49.83992681479357,"lng":24.01575654745102},{"lat":49.83994065338674,"lng":24.015413224697113},{"lat":49.839266017361,"lng":24.01476413011551},{"lat":49.839349049995214,"lng":24.013433754444122},{"lat":49.83898232145154,"lng":24.013315737247467},{"lat":49.83896848258411,"lng":24.013664424419403},{"lat":49.83878511721673,"lng":24.013648331165314},{"lat":49.838778197755296,"lng":24.013798534870148},{"lat":49.838466820965586,"lng":24.01376098394394},{"lat":49.8384806599766,"lng":24.013546407222748},{"lat":49.83813814328994,"lng":24.01350885629654},{"lat":49.83810354550992,"lng":24.01370197534561},{"lat":49.83805856835887,"lng":24.014152586460114},{"lat":49.83800667159413,"lng":24.014136493206024},{"lat":49.83790287789755,"lng":24.015085995197296},{"lat":49.83875397963245,"lng":24.01673823595047},{"lat":49.83947705836027,"lng":24.015863835811615},{"lat":49.839750372383826,"lng":24.015890657901764}]'),
(14, 49.90215348414364, 24.277381896972656, 49.74489390461096, 23.91826629638672, 14, '[{"lat":49.89242267614535,"lng":23.91826629638672},{"lat":49.74666869146797,"lng":23.91895294189453},{"lat":49.74489390461096,"lng":24.277381896972656},{"lat":49.90215348414364,"lng":24.26502227783203}]'),
(15, 49.80481940007729, 24.018521904945374, 49.80198034546755, 24.014734625816345, 15, '[{"lat":49.80448010718857,"lng":24.018521904945374},{"lat":49.80481940007729,"lng":24.015045762062073},{"lat":49.803372195481934,"lng":24.014734625816345},{"lat":49.803302950158404,"lng":24.01564657688141},{"lat":49.80220193620765,"lng":24.015442728996277},{"lat":49.80221578559521,"lng":24.01582896709442},{"lat":49.80198034546755,"lng":24.0178245306015},{"lat":49.802077291541146,"lng":24.017931818962097}]'),
(16, 49.82207034733334, 24.01204490714008, 49.81863698661844, 24.0075817113393, 16, '[{"lat":49.82207034733334,"lng":24.00981330925},{"lat":49.82040907418582,"lng":24.0075817113393},{"lat":49.818858501113716,"lng":24.00775337271625},{"lat":49.81863698661844,"lng":24.0104999547475},{"lat":49.82051982750384,"lng":24.01204490714008}]');

--
-- Dumping data for table `registration_number_of_the_resource`
--

INSERT INTO `registration_number_of_the_resource` (`number_id`, `number`, `registrator_number`, `user_id`) VALUES
(1, 11, '804:23:17:026:79000:', 2);

--
-- Dumping data for table `registrator_owner`
--

INSERT INTO `registrator_owner` (`owner_id`, `registrator_id`) VALUES
(3, 2),
(5, 2),
(6, 2),
(3, 4);

--
-- Dumping data for table `resource_discrete_values`
--

INSERT INTO `resource_discrete_values` (`resource_discrete_value_id`, `comment`, `value`, `discrete_parameter_id`, `resource_id`) VALUES
(3, NULL, 100, 3, 2),
(4, NULL, 500.55, 4, 2),
(5, NULL, 23.54, 3, 3),
(6, NULL, 200, 4, 3),
(7, NULL, 3280.3, 1, 4),
(8, NULL, 53.46747, 2, 4),
(9, NULL, 3299, 1, 5),
(10, NULL, 21.91676, 2, 5),
(11, NULL, 1860.6, 1, 6),
(12, NULL, 14.8679, 2, 6),
(13, NULL, 1743.7, 1, 7),
(14, NULL, 7.07496, 2, 7),
(15, NULL, 482.9, 1, 8),
(16, NULL, 1.98205, 2, 8),
(17, NULL, 2195.6, 1, 9),
(18, NULL, 19.00922, 2, 9),
(19, NULL, 241.5, 1, 10),
(20, NULL, 0.72436, 2, 10),
(21, NULL, 932.4, 1, 11),
(22, NULL, 4.33756, 2, 11),
(23, NULL, 1299.1, 1, 12),
(24, NULL, 9.43888, 2, 12),
(25, NULL, 802.1, 1, 13),
(26, NULL, 3.1126, 2, 13),
(27, NULL, 100, 3, 14),
(28, NULL, 100, 4, 14),
(29, NULL, 42728.62051, 3, 14),
(30, NULL, 791.4, 1, 15),
(31, NULL, 6.20849, 2, 15),
(32, '', 843, 1, 16),
(33, '', 7.84, 2, 16);

--
-- Dumping data for table `resource_linear_values`
--

INSERT INTO `resource_linear_values` (`resource_linear_param_id`, `maximal_value`, `minimal_value`, `linear_parameter_id`, `resource_id`) VALUES
(1, 2483.5, 2400, 1, 2),
(2, 5350, 5150, 1, 2),
(3, 2700, 2500, 1, 2),
(4, 2483.5, 1100, 1, 3),
(5, 5350, 1110, 1, 3),
(6, 2100, 9999, 1, 14),
(7, 102.4, 102.4, 1, 14);

--
-- Dumping data for table `territorial_community`
--

INSERT INTO `territorial_community` (`territorialCommunity_id`, `name`) VALUES
(2, 'Львівська'),
(3, 'Дрогобицька'),
(4, 'Стрийська'),
(5, 'Пустомитська'),
(6, 'Жовківська');

--
-- Dumping data for table `tomes`
--

INSERT INTO `tomes` (`tome_id`, `identifier`, `registrator_id`) VALUES
(1, '12345', 2),
(2, '6789', 4);

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `account_non_expired`, `account_non_locked`, `attempts`, `credentials_non_expired`, `date_of_accession`, `email`, `enabled`, `first_name`, `last_modified`, `last_name`, `login`, `middle_name`, `password`, `phonenumber`, `status`, `role_id`, `territorialCommunity_id`) VALUES
(2, 1, 1, 0, 1, '2016-01-02 00:00:00', 'petro@gmail.com', 1, 'Петро', NULL, 'Петренко', 'registrator', 'Петрович', '$2a$10$KJdq1wmP3MctLh.lEdAuseUCnSRdhJo8S7qwaZHFEUoGhfjOsOnrm', '+380634898677', 'ACTIVE', 2, 1),
(3, 1, 1, 0, 1, '2016-01-02 00:00:00', 'ivan@gmail.com', 1, 'Юрій', NULL, 'Іванов', 'user', 'Іванович', '$2a$10$Wcuw6mLD18wVT5diGYncJeVyL8J1bTSIly2IbLUX2bJ.UWZPC.qS.', '+380633333333', 'ACTIVE', 3, 1),
(4, 1, 1, 0, 1, '2016-01-02 00:00:00', 'vasyl@gmail.com', 1, 'Василь', NULL, 'Василюк', 'vasyl', 'Васильович', 'pass4', '+380505050550', 'ACTIVE', 2, 1),
(5, 1, 1, 0, 1, '2016-01-02 00:00:00', 'oleh@gmail.com', 1, 'Олег', NULL, 'Василюк', 'oleh', 'Олеговчич', 'pass5', '+380999999999', 'INACTIVE', 3, 5),
(6, 1, 1, 0, 1, '2016-01-02 00:00:00', 'andr@gmail.com', 1, 'Андрій', NULL, 'Іванов', 'commissioner', 'Петрович', '$2a$10$JUp23T7bbFnzdqAJGrAq8Of.e3TUtw/32GtWbV8Cs8005ctg8.zyu', '+3806969696', 'ACTIVE', 4, 1);

--
-- Dumping data for table `will_data`
--

INSERT INTO `will_data` (`will_id`, `accession_date`, `comment`, `user_id`) VALUES
(1, '2016-01-02 00:00:00', 'comment', 2);

SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
