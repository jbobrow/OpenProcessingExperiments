
//Original Sketch by John Harding remixed by Owaun Scantlebury
//http://www.openprocessing.org/visuals/?visualID=706

//Sketches to try this technique with
//http://www.openprocessing.org/visuals/?visualID=5993
//http://www.openprocessing.org/visuals/?visualID=2723

import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;
// spring thing
//click mouse to erode

float[] rightNode = new float[3];
float[] upNode = new float[3];
float[] leftNode = new float[3];
float[] downNode = new float[3];
PFont font;


boolean seedCountBool=true;
float damping=1;
float itCount=1;


float[] pointData= {
  -15.7035928728866, 76.9146825728439, 80.0,
  -11.6991759975474, 76.9146825728439, 79.5924434709403,
  -7.20309809108219, 76.9146825728439, 78.2919265168696,
  -2.26028249643638, 76.9146825728439, 76.2140784686655,
  3.08434744344446, 76.9146825728439, 73.4745286572061,
  8.7858683856148, 76.9146825728439, 70.188906413369,
  14.7993569871291, 76.9146825728439, 66.472841068032,
  21.0798899050419, 76.9146825728439, 62.441961952073,
  27.5825437964075, 76.9146825728439, 58.2118983963697,
  34.2623953182806, 76.9146825728439, 53.8982797318,
  41.0745211277154, 76.9146825728439, 49.6167352892416,
  47.9739978817666, 76.9146825728439, 45.4828943995724,
  54.9159022374886, 76.9146825728439, 41.6123863936701,
  61.8553108519359, 76.9146825728439, 38.1208406024126,
  68.7473003821628, 76.9146825728439, 35.1238863566776,
  75.546947485224, 76.9146825728439, 32.737152987343,
  82.2093288181738, 76.9146825728439, 31.0762698252865,
  88.6895210380667, 76.9146825728439, 30.2568662013861,
  94.9426008019573, 76.9146825728439, 30.3945714465194,
  100.9236447669, 76.9146825728439, 31.6050148915642,

  -15.7035928728866, 67.6921343596171, 72.4530707063727,
  -11.5869167352349, 67.8852156290815, 73.4568772349955,
  -7.00267889423271, 68.0793703837921, 73.4729320958634,
  -1.99375669356197, 68.2758690454749, 72.6171739317224,
  3.39697252309535, 68.4759820358559, 71.0055413853183,
  9.1266314120573, 68.680979776661, 68.7539730993971,
  15.1523426296419, 68.8921326896162, 65.9784077167048,
  21.4312288321673, 69.1107111964474, 62.7947838799873,
  27.9204126759514, 69.3379857188806, 59.3190402319904,
  34.5770168173122, 69.5752266786417, 55.6671154154603,
  41.358163912568, 69.8237044974567, 51.9549480731426,
  48.2209766180366, 70.0846895970515, 48.2984768477836,
  55.1225775900362, 70.3594523991521, 44.8136403821289,
  62.0200894848848, 70.6492633254845, 41.6163773189247,
  68.8706349589003, 70.9553927977746, 38.8226263009167,
  75.631336668401, 71.2791112377484, 36.5483259708511,
  82.2593172697047, 71.6216890671318, 34.9094149714736,
  88.7116994191296, 71.9843967076507, 34.0218319455303,
  94.9456057729937, 72.3685045810312, 34.001515535767,
  100.918158987615, 72.7752831089992, 34.9644043849297,

  -15.7035928728866, 59.6770086373183, 65.1540307617426,
  -11.4750318341136, 59.992692877181, 67.2828121754604,
  -6.80300841976565, 60.3105240875361, 68.3680703203671,
  -1.72835397426119, 60.6330431118357, 68.5239994857248,
  3.70810015798139, 60.9627907935316, 67.8647939607957,
  9.46552263254373, 61.3023079760757, 66.5046480348416,
  15.5030821050075, 61.6541355029199, 64.5577559971248,
  21.7799472309541, 62.0208142175161, 62.1383121369074,
  28.2552866659655, 62.4048849633164, 59.3605107434515,
  34.888269065623, 62.8088885837725, 56.338546106019,
  41.6380630855084, 63.2353659223363, 53.1866125138722,
  48.4638373812033, 63.6868578224599, 50.0189042562731,
  55.3247606082892, 64.1659051275951, 46.9496156224837,
  62.1800014223479, 64.6750486811937, 44.0929409017662,
  68.9887284789609, 65.2168293267078, 41.5630743833827,
  75.7101104337098, 65.7937879075892, 39.4742103565952,
  82.3033159421762, 66.4084652672899, 37.9405431106658,
  88.7275136599419, 67.0634022492617, 37.0762669348567,
  94.9418722425883, 67.7611396969566, 36.9955761184299,
  100.905560345697, 68.5042184538264, 37.8126649506475,

  -15.7035928728866, 52.7255233876591, 58.2030820318207,
  -11.3638956553747, 53.1017362024075, 61.1946719191047,
  -6.60483539006343, 53.4811694728946, 63.1216510624661,
  -1.4651974221077, 53.8676344642983, 64.09464391737,
  4.01623290333773, 54.2649424417965, 64.2242749392821,
  9.80067024111804, 54.676904670567, 63.6211685836675,
  15.8493292460784, 55.1073324157877, 62.3959493059916,
  22.1234245730641, 55.5600369426364, 60.65924156172,
  28.5841708769202, 56.0388295162912, 58.5216698063178,
  35.1927828124919, 56.5475214019296, 56.0938584952505,
  41.9104750346246, 57.0899238647298, 53.4864320839834,
  48.6984621981632, 57.6698481698695, 50.8100150279819,
  55.5179589579531, 58.2911055825266, 48.1752317827114,
  62.3301799688394, 58.957507367879, 45.6927068036373,
  69.0963398856674, 59.6728647911045, 43.4730645462248,
  75.7776533632822, 60.440989117381, 41.6269294659394,
  82.3353350565289, 61.2656916118863, 40.2649260182464,
  88.7305996202529, 62.1507835397984, 39.4976786586112,
  94.9246617092992, 63.1000761662951, 39.4358118424992,
  100.878735978513, 64.1173807565543, 40.1899500253758,

  -15.7035928728866, 46.6938965923512, 51.7004263823184,
  -11.2538825602094, 47.0769674900262, 55.3168800926985,
  -6.4089085275085, 47.4643323286862, 57.8779841942459,
  -1.20541012067511, 47.861072795235, 59.4891960133553,
  4.31987331439951, 48.2722705765765, 60.2559728764217,
  10.1302024318241, 48.7030073596143, 60.2837721098399,
  16.1888378857076, 49.1583648312524, 59.6780510400049,
  22.4590403301585, 49.6434246783947, 58.5442669933114,
  28.9040704192858, 50.1632685879448, 56.9878772961545,
  35.4871888071981, 50.7229782468067, 55.1143392749289,
  42.1716561480044, 51.3276353418841, 53.0291102560296,
  48.9207330958132, 51.9823215600809, 50.8376475658514,
  55.6976803047334, 52.6921185883009, 48.6454085307893,
  62.4657584288737, 53.4621081134479, 46.557850477238,
  69.188228122343, 54.2973718224258, 44.6804307315925,
  75.82835003925, 55.2029914021383, 43.1186066202477,
  82.3493848337034, 56.1840485394893, 41.9778354695985,
  88.7145931598121, 57.2456249213827, 41.3635746060397,
  94.8872356716847, 58.3928022347221, 41.3812813559662,
  100.83057302343, 59.6306621664115, 42.1364130457729,

  -15.7035928728866, 41.438346233106, 45.7462656789465,
  -11.145366909809, 41.7830086253022, 49.7738603230115,
  -6.21597655448326, 42.1330384437296, 52.781379587792,
  -0.950115153537084, 42.494787797018, 54.8677445603777,
  4.61752394640189, 42.8746087937972, 56.1318763278585,
  10.452247398706, 43.2788535426969, 56.672695977324,
  16.5193618567476, 43.713874152347, 56.589124595864,
  22.784173973899, 44.1860227313771, 55.9800832705683,
  29.2119904035326, 44.7016513884172, 54.9444930885265,
  35.7681177990207, 45.2671122320969, 53.5812751368285,
  42.4178628137356, 45.8887573710461, 51.9893505025639,
  49.1265321010497, 46.5729389138945, 50.2676402728226,
  55.8594323143354, 47.3260089692719, 48.5150655346942,
  62.5818701069649, 48.1543196458081, 46.8305473752685,
  69.2591521323107, 49.0642230521328, 45.3130068816353,
  75.856585043745, 50.0620712968758, 44.0613651408843,
  82.3394754946402, 51.154216488667, 43.1745432401052,
  88.6731301383687, 52.347010736136, 42.7514622663878,
  94.8228556283028, 53.6468061479127, 42.8910433068219,
  100.753958617815, 55.0599548326269, 43.6922074484971,

  -15.7035928728866, 36.8150902916353, 40.4408017874164,
  -11.0387230653646, 37.0844814935006, 44.6900362368136,
  -6.02678819337016, 37.3603136068434, 47.97614711519,
  -0.700435604267245, 37.6502091620194, 50.3903783451346,
  4.90768735458001, 37.9617906893844, 52.0239738492366,
  10.7649333358075, 38.302680719294, 52.9681775500849,
  16.8386549920512, 38.680501782104, 53.3142333702687,
  23.096204975947, 39.1028764081702, 53.1533852323771,
  29.5049359401309, 39.5774271278482, 52.5768770589989,
  36.0322005372386, 40.1117764714938, 51.6759527727234,
  42.6453514199062, 40.7135469694627, 50.5418562961396,
  49.3117412407696, 41.3903611521107, 49.2658315518366,
  55.9987226524647, 42.1498415497936, 47.9391224624034,
  62.6736483076273, 42.9996106928669, 46.652972950429,
  69.3038708588935, 43.9472911116865, 45.4986269385026,
  75.8567429588991, 45.0005053366081, 44.5673283492132,
  82.2996172602801, 46.1668758979874, 43.9503211051498,
  88.5998464156723, 47.4540253261802, 43.7388491289016,
  94.7247830777118, 48.8695761515422, 44.0241563430575,
  100.641779899034, 50.4211509044291, 44.8974866702067,

  -15.7035928728866, 32.6803467496504, 35.8842365734392,
  -10.9343253880676, 32.8460079798865, 40.1898314608747,
  -5.84209216655161, 33.0191836068463, 43.6065966485253,
  -0.45749455643924, 33.2087665826115, 46.2171861543231,
  5.18886609416903, 33.4236498592638, 48.1042539962,
  11.0663884371727, 33.6727263888849, 49.3504541920878,
  17.1444711244712, 33.9648891235564, 50.0384407599186,
  23.3925128079641, 34.3090310153601, 50.2508677176242,
  29.7799121395509, 34.7140450163776, 50.0703890831368,
  36.2760677711311, 35.1888240786907, 49.579658874388,
  42.8503783546041, 35.7422611543809, 48.86133110931,
  49.4722425418694, 36.3832491955301, 47.9980598058346,
  56.1110589848266, 37.1206811542199, 47.0724989818938,
  62.7362263353751, 37.963449982532, 46.1673026554195,
  69.3171432454144, 38.920448632548, 45.3651248443438,
  75.8232083668441, 40.0005700563498, 44.7486195665984,
  82.2238203515635, 41.2127072060188, 44.4004408401154,
  88.4883778514722, 42.5657530336369, 44.4032426828267,
  94.5862795184698, 44.0686004912857, 44.8396791126642,
  100.486924004456, 45.730142531047, 45.7924041475599,

  -15.7035928728866, 28.8903335888632, 32.1767719027259,
  -10.832548239109, 28.9322099697251, 36.3976696219645,
  -5.66263719641004, 28.9826742325569, 39.8170380598836,
  -0.222415093626702, 29.0518897511664, 42.5082567746404,
  5.45956272040409, 29.1500198993611, 44.5447053243927,
  11.3547408968454, 29.2872280509487, 45.9997632672977,
  17.4345640868603, 29.4736775797369, 46.9468101615132,
  23.6704769416118, 29.7195318595332, 47.4592255651964,
  30.0339241122631, 30.0349542641453, 47.610389036505,
  36.4963502499771, 30.4301081673809, 47.4736801335964,
  43.029200005917, 30.9151569430476, 47.1224784146282,
  49.6039180312459, 31.5002639649531, 46.6301634377577,
  56.1919489771267, 32.195592606905, 46.0701147611426,
  62.7647374947226, 33.0113062427109, 45.5157119429403,
  69.2937282351965, 33.9575682461785, 45.0403345413082,
  75.7503658497117, 35.0445419911154, 44.717362114404,
  82.1060949894311, 36.2823908513293, 44.6201742203851,
  88.3323603055178, 37.6812782006278, 44.8221504174089,
  94.4006064491349, 39.2513674128185, 45.396670263633,
  100.282278071445, 41.0028218617092, 46.417113317215,

  -15.7035928728866, 25.301268790985, 29.4186096409877,
  -10.7337659796801, 25.2077093482814, 33.437974346853,
  -5.48917200532787, 25.1238112727939, 36.7517812213501,
  0.0036797005967312, 25.0610083600563, 39.4236789927837,
  5.71827978852033, 25.0307344056021, 41.5173163894587,
  11.6281189088696, 25.0444232049649, 43.0963421396798,
  17.7066877120711, 25.1135085536783, 44.224404971752,
  23.9274768485516, 25.2494242472758, 44.96515361398,
  30.2639769687376, 25.4636040812912, 45.3822367946687,
  36.6896787230559, 25.767481851258, 45.5393032421229,
  43.178072761933, 26.1724913527098, 45.5000016846474,
  49.7026497357956, 26.6900663811802, 45.3279808505471,
  56.2369002950703, 27.3316407322027, 45.0868894681268,
  62.7543150901838, 28.1086482013111, 44.8403762656913,
  69.2283847715628, 29.0325225840388, 44.6520899715455,
  75.6325999896337, 30.1146976759196, 44.5856793139941,
  81.9404513948234, 31.3666072724869, 44.7047930213421,
  88.1254296375585, 32.7996851692745, 45.0730798218942,
  94.1610253682654, 34.4253651618158, 45.7541884439553,
  100.020729237371, 36.2550810456445, 46.8117676158302,

  -15.7035928728866, 21.7693703377275, 27.7099516539357,
  -10.6383529709721, 21.5371280008205, 31.4351692623101,
  -5.32244531568753, 21.3156205163759, 34.5551360050106,
  0.219666742657418, 21.1175521016534, 37.1235415954503,
  5.96351985375292, 20.9556269739124, 39.1940757470421,
  11.8846506672892, 20.8425493504125, 40.8204281731993,
  17.9585958329565, 20.7910234484133, 42.0562885873347,
  24.1608920004449, 20.8137534851743, 42.9553467028616,
  30.4670758194449, 20.9234436779551, 43.5712922331929,
  36.8526839396464, 21.1327982440153, 43.9578148917416,
  43.2932530107398, 21.4545214006143, 44.168604391921,
  49.7643196824152, 21.9013173650117, 44.2573504471439,
  56.241420604363, 22.4858903544672, 44.2777427708235,
  62.7000924262732, 23.2209445862401, 44.2834710763728,
  69.1158717978362, 24.1191842775902, 44.3282250772049,
  75.4642953687421, 25.193313645777, 44.4656944867328,
  81.7208997886811, 26.45603690806, 44.7495690183696,
  87.8612217073435, 27.9200582816987, 45.2335383855283,
  93.8607977744195, 29.5980819839527, 45.971292301622,
  99.6951646395992, 31.5028122320817, 47.0165204800638,

  -15.7035928728866, 18.1849250424449, 27.1204257226303,
  -10.5466835741763, 17.8174532026681, 30.4799358059656,
  -5.16320584987145, 17.4617897006, 33.3352245752786,
  0.424422948981723, 17.1319091752261, 35.7299846982507,
  6.193785471337, 16.8417862655319, 37.7079088425634,
  12.1224643661482, 16.605395610503, 39.312689675898,
  18.1880422823691, 16.4367118491247, 40.588019865936,
  24.3681018689534, 16.3497096203828, 41.5775920803589,
  30.640225774855, 16.3583635632625, 42.3250989868481,
  36.9819966490277, 16.4766483167496, 42.8742332530849,
  43.3709971404253, 16.7185385198294, 43.2686875467509,
  49.7848098980015, 17.0980088114875, 43.5521545355274,
  56.2010175707101, 17.6290338307093, 43.7683268870959,
  62.597202807505, 18.3255882164805, 43.9608972691379,
  68.9509482573398, 19.2016466077865, 44.1735583493347,
  75.2398365691685, 20.2711836436129, 44.4500027953677,
  81.4414503919448, 21.548173962945, 44.8339232749185,
  87.5333723746224, 23.0465922047685, 45.3690124556684,
  93.4931851661552, 24.7804130080689, 46.0989630052989,
  99.298471415497, 26.7636110118316, 47.0674675914914,

  -15.7035928728866, 14.574495045062, 27.5973632895282,
  -10.4591321504838, 14.0751337893919, 30.5279866588895,
  -5.01220233026204, 13.5886543566767, 33.05541826588,
  0.616825235996006, 13.1303018076279, 35.2133537324496,
  6.40757919650772, 12.7153212029569, 37.0354886805481,
  12.3396881994905, 12.3589576033753, 38.5555187321253,
  18.3927808931616, 12.0764560695945, 39.8071395091309,
  24.5464859257385, 11.883061662326, 40.8240466335148,
  30.7804319454385, 11.7940194422812, 41.6399357272269,
  37.074247600479, 11.8245744701715, 42.2885024122168,
  43.4075615390774, 11.9899718067086, 42.8034423104345,
  49.760002409451, 12.3054565126038, 43.2184510438296,
  56.1111988598172, 12.7862736485685, 43.5672242343521,
  62.4407795383933, 13.4476682753144, 43.8834575039517,
  68.7283730933967, 14.3048854535527, 44.2008464745783,
  74.9536081730448, 15.3731702439951, 44.5530867681815,
  81.096113425555, 16.6677677073529, 44.9738740067113,
  87.1355174991446, 18.2039229043376, 45.4969038121175,
  93.0514490420309, 19.9968808956607, 46.1558718063498,
  98.8235367024313, 22.0618867420337, 46.984473611358,

  -15.7035928728866, 10.9987113171462, 29.0575217124357,
  -10.3760730610858, 10.3689839866199, 31.5012923130119,
  -4.87018347924175, 9.75321196429478, 33.642900702869,
  0.79575052012663, 9.16791073260825, 35.5060454582251,
  6.60340358450022, 8.62959577399774, 37.1144251552985,
  12.53445036136, 8.15478257090068, 38.4917383703072,
  18.5705654981868, 7.75998660575448, 39.6616836794695,
  24.6934236424617, 7.46172336099657, 40.6479596590035,
  30.8846994416656, 7.27650831906438, 41.4742648851275,
  37.1260675432793, 7.22085696239531, 42.1642979340596,
  43.399202594784, 7.31128477342679, 42.7417573820179,
  49.6857792436604, 7.56430723459624, 43.2303418052208,
  55.9674721373896, 7.99643982834109, 43.6537497798862,
  62.2259559234524, 8.62419803709875, 44.0356798822325,
  68.4429052493298, 9.46409734330665, 44.3998306884779,
  74.5999947625028, 10.5326532294022, 44.7699007748404,
  80.6788991104523, 11.8463811778228, 45.1695887175382,
  86.6612929406593, 13.421796671006, 45.6225930927896,
  92.5288509006045, 15.275415191389, 46.1526124768127,
  98.2632476377691, 17.4237522214094, 46.7833454458258,

  -15.7035928728866, 7.51820483026493, 31.4176583491586,
  -10.2978806671737, 6.75781801998037, 33.3218232602629,
  -4.73789801919298, 6.01246000314325, 35.0248555122996,
  0.960075717799955, 5.29991668391692, 36.5404566357553,
  6.77976119054966, 4.63797396646478, 37.8823281611165,
  12.7048790458007, 4.04441775495019, 39.0641716188699,
  18.7191499302975, 3.53703395353654, 40.0996885395019,
  24.8062944907846, 3.1336084663872, 41.002580453499,
  30.9500333740065, 2.85192719766555, 41.786548891348,
  37.1340872267078, 2.70977605153495, 42.4652953835353,
  43.3421766956329, 2.7249409321588, 43.0525214605474,
  49.5580224275264, 2.91520774370046, 43.5619286528709,
  55.7653450691328, 3.29836239032332, 44.0072184909925,
  61.9478652671966, 3.89219077619075, 44.4020925053985,
  68.0893036684623, 4.71447880546611, 44.7602522265757,
  74.1733809196744, 5.78301238231281, 45.0953991850105,
  80.1838176675774, 7.1155774108942, 45.4212349111894,
  86.104334558916, 8.72995979537366, 45.7514609355991,
  91.9186522404344, 10.6439454399146, 46.0997787887261,
  97.6104913588774, 12.8753202486803, 46.479890001057,

  -15.7035928728866, 4.19360655598553, 34.5945305575032,
  -10.2249293299385, 3.30045011510141, 35.9115499925726,
  -4.61609467249818, 2.42339595291097, 37.1284663202259,
  1.10867774544234, 1.58150039530353, 38.2489840252183,
  6.93515456989119, 0.793819768168432, 39.2768075923045,
  12.8491024468564, 0.0794103973949971, 40.2156415062395,
  18.8362880223462, -0.542671391127435, 41.0691902517782,
  24.8824779423686, -1.05336927150953, 41.8411583136756,
  30.9734388529316, -1.43362691786197, 42.5352501766866,
  37.0949374000434, -1.66438800429541, 43.1551703255661,
  43.232740229712, -1.72659620492052, 43.704623245069,
  49.3726139879456, -1.60119519384798, 44.1873134199504,
  55.5003253207522, -1.26912864518843, 44.606945334965,
  61.60164087414, -0.711340233052572, 44.9672234748679,
  67.662327294117, 0.0912263684489448, 45.2718523244139,
  73.6681512266912, 1.15762748520546, 45.524536368358,
  79.6048793178709, 2.50691944310628, 45.7289800914551,
  85.458278213664, 4.15815856804076, 45.8888879784602,
  91.2141145600787, 6.13040118589822, 46.0079645141282,
  96.858155003123, 8.44270362256801, 46.0899141832139,

  -15.7035928728866, 1.08554746587543, 38.5048956952754,
  -10.1575934105715, 0.0556944976111743, 39.1924430018709,
  -4.50552216153975, -0.956982706713164, 39.880916752702,
  1.24043351948016, -1.9321573994823, 40.564024386792,
  7.06808627775995, -2.84950283308094, 41.2354733431643,
  12.9652487585713, -3.6886922598938, 41.888971060842,
  18.9197336071858, -4.42939893230559, 42.5182249788486,
  24.9193534688752, -5.05129610270103, 43.1169425362072,
  30.9519209889112, -5.53405702346483, 43.6788311719414,
  37.0052488125653, -5.8573549469817, 44.1975983250742,
  43.0671495851092, -6.00086312563635, 44.666951434629,
  49.1254359518148, -5.9442548118135, 45.0805979396292,
  55.1679205579534, -5.66720325789786, 45.432245279098,
  61.182416048797, -5.14938171627413, 45.7156008920588,
  67.156735069617, -4.37046343932704, 45.9243722175347,
  73.0786902656852, -3.3101216794413, 46.0522666945493,
  78.9360942822733, -1.94802968900162, 46.0929917621256,
  84.7167597646528, -0.263860720392704, 46.0402548592872,
  90.4084993580955, 1.76271197400072, 45.8877634250571,
  95.999125707873, 4.15201514179396, 45.6292248984589,

  -15.7035928728866, -1.74534146849796, 43.0655111202813,
  -10.0962472702638, -2.91763460686219, 43.086472780088,
  -4.40692920870014, -4.07167849604026, 43.209390435782,
  1.35421995633977, -5.18587596669092, 43.4179744806548,
  7.1770588693911, -6.23862984947294, 43.6959353079981,
  13.0514461749891, -7.20834297504506, 44.0269833111037,
  18.967240517669, -8.07341817406606, 44.3948288832631,
  24.914300541966, -8.81225827719467, 44.7831824177682,
  30.8824848924155, -9.40326611508967, 45.1757543079105,
  36.8616522135525, -9.8248445184098, 45.5562549469817,
  42.8416611499124, -10.0553963178138, 45.9083947282735,
  48.8123703460304, -10.0733243439605, 46.2158840450776,
  54.7636384464418, -9.8570314275086, 46.4624332906857,
  60.6853240956817, -9.38492039911686, 46.6317528583894,
  66.5672859382854, -8.63539408944404, 46.7075531414804,
  72.3993826187882, -7.5868553291489, 46.6735445332504,
  78.1714727817252, -6.2177069488902, 46.5134374269911,
  83.8734150716317, -4.50635177932669, 46.2109422159942,
  89.4950681330431, -2.43119265111713, 45.7497692935512,
  95.0262906104944, 0.029367605079722, 45.113629052954,

  -15.7035928728866, -4.23842927556723, 48.1931341903269,
  -10.0412652702069, -5.56072297269053, 47.515609819154,
  -4.32106453636175, -6.86369393538142, 47.0410709955198,
  1.44891397244752, -8.12447457257271, 46.7432310669845,
  7.26057490001977, -9.3201972931972, 46.5958033811081,
  13.1058228901538, -10.4279945061877, 46.5725012854505,
  18.9765625866485, -11.424998620477, 46.647038127572,
  24.8646986333025, -12.2883420449978, 46.7931272550325,
  30.7621356739149, -12.9951571886831, 46.9844820153921,
  36.6607783522842, -13.5225764604656, 47.1948157562107,
  42.5525313122094, -13.8477322692781, 47.3978418250486,
  48.4292991974893, -13.9477570240534, 47.5672735694658,
  54.2829866519227, -13.7997831337243, 47.6768243370222,
  60.1054983193084, -13.3809430072237, 47.7002074752779,
  65.8887388434451, -12.6683690534842, 47.6111363317931,
  71.6246128681318, -11.6391936814388, 47.3833242541277,
  77.3050250371672, -10.2705493000201, 46.9904845898418,
  82.9218799943502, -8.53956831816113, 46.4063306864955,
  88.4670823834795, -6.42338314479454, 45.6045758916487,
  93.932536848354, -3.89912618885317, 44.5589335528616,

  -15.7035928728866, -6.33308498376497, 53.8045222632183,
  -9.9930217715917, -7.81475637424569, 52.4018246109988,
  -4.24867686690703, -9.27603154504776, 51.3031420579697,
  1.52339248422978, -10.692772483378, 50.4721909059593,
  7.31713692488113, -12.0408411764433, 49.8726874567962,
  13.1265070981094, -13.2960996114505, 49.4683480123087,
  18.945453646977, -14.4344097756064, 49.2228888743253,
  24.7679272145463, -15.4316336561179, 49.1000263446743,
  30.5878784438796, -16.2636332401919, 49.0634767251843,
  36.3992579780395, -16.9062705150351, 49.0769563176835,
  42.1960164600881, -17.3354074678544, 49.1041814240006,
  47.9721045330881, -17.5269060858567, 49.1088683459639,
  53.7214728401017, -17.4566283562488, 49.0547333854017,
  59.4380720241913, -17.1004362662375, 48.9054928441426,
  65.1158527284193, -16.4341918030298, 48.624863024015,
  70.7487655958481, -15.4337569538324, 48.1765602268473,
  76.33076126954, -14.0749937058522, 47.5243007544679,
  81.8557903925576, -12.333764046296, 46.6318009087053,
  87.3178036079631, -10.1859299623707, 45.4627769913878,
  92.7107515588189, -7.60735344128317, 43.980945304344};

//Rebuild the array
//first, assuming a square point distribution find the length of indexing
int squareDim = int(sqrt(pointData.length/3));

float g = 9.81;
int HOR = squareDim;
int VER = squareDim;
float k = 0.03;

float[][][] particle = new float[HOR][VER][16]; //note 8,9, 10,11, 12,13, 14,15  are vertices of neighbours
import processing.opengl.*;

import processing.video.*; 
public int pn=0; 

public String savename ="k-springs-"; 
MovieMaker mm;  
public boolean firstpass = true; 
public int frate = 10;
public boolean inc = true; 
public boolean addmovframe = true; 
public boolean dovid =false; 
public boolean looponce = false; 
public boolean snap = true; 
public boolean savelayer2 = false;

void saveget(){ 
  setupvid(); 
  if (dovid){ 
    if (inc){ 
      pn++; 
    } 


    save(savename+str(pn)+".png"); 
  } 

  if (addmovframe){ 

if (savelayer2){

    raw = new PImage (HOR,VER);
    arraycopy(ax.pixels,raw.pixels);
    raw.resize(width,height);
    picg++;
    PGraphics op = createGraphics(width,height,P3D);
    op.loadPixels();
    op.beginDraw();
    if (raw!=null){
      //    for (int i=0; i<HOR; i++){
      //      for (int j=0; j<VER; j++){
      //        
      //       // op.set(i,j,raw.get(i,j));
      //        
      //    }
      //  }
      op.image(raw,0,0,width,height,0,0,width,height);
      op.endDraw();
      op.updatePixels();

      //arraycopy(op.pixels,mm.pixels);
    }
    arraycopy(op.pixels,pixels);
}
    mm.addFrame(); 
  }  

  if (looponce){ 
    noLoop(); 
    exit();  
  } 

  if (keyPressed ==true && ( key=='`' || key =='~' || key == ESC)){ 
    mm.finish(); 
    exit();  
  } 

} 

void setupvid(){ 
  if (firstpass) 
  {
    mm = new MovieMaker(this, width, height, savename+".mov", frate,  
    MovieMaker.ANIMATION, MovieMaker.LOSSLESS); 

    if (snap){ 
      save("snap"+savename+str(pn)+".png"); 
    } 
    firstpass = false; 


  } 
} 


void loop(){ 

 saveget();  //uncomment to save video 

} 



void setup(){
  println(squareDim);
  //colorMode(RGB, 1);
  background(1);

  size(750, 600,P3D);
  loadPixels();
smooth();
  // camera(-125, -75, 50, 100, 120, 200, 1, 1, 1);
  cam = new PeasyCam (this,width);
  font = loadFont("ISOCPEUR-24.vlw"); 
  int counter=0;
  for (int i=0; i<squareDim; i++){
    for (int j=0; j<squareDim; j++){
      particle[i][j][0] = pointData[counter];
      particle[i][j][1] = pointData[counter+1];
      particle[i][j][2] = pointData[counter+2];
      particle[i][j][7] = 1; // 1 is alive. 0 is dead
      counter=counter+3;
    }
  }
  for (int i=1; i<squareDim-1; i++){
    for (int j=1; j<squareDim-1; j++){
      particle[i][j][3] =0;
      particle[i][j][4] = 0;
      particle[i][j][5] =2;

      particle[i][j][6] = 1; //the mass

      particle[i][j][8] = i+1;
      particle[i][j][9] = j;

      particle[i][j][10] = i;
      particle[i][j][11] = j+1;

      particle[i][j][12] = i-1;
      particle[i][j][13] = j;

      particle[i][j][14] = i;
      particle[i][j][15] = j-1;
    }
  }
  ax = new PImage(HOR,VER);
  raw = new PImage (HOR,VER);
}

int x = 0;
public PImage ax,raw;
void showimg(){
  for (int i=0; i<HOR; i++){

    for (int j=0; j<VER; j++){
      set(i,j,ax.get(i,j));
    }

  }
  raw = new PImage (HOR,VER);
  arraycopy(ax.pixels,raw.pixels);
  raw.resize(width,height);

}

public int picg;
void showfullimg(){
  raw = new PImage (HOR,VER);
  arraycopy(ax.pixels,raw.pixels);
  raw.resize(width,height);
  picg++;
  PGraphics op = createGraphics(width,height,P3D);
  op.loadPixels();
  op.beginDraw();
  if (raw!=null){
    //    for (int i=0; i<HOR; i++){
    //      for (int j=0; j<VER; j++){
    //        
    //       // op.set(i,j,raw.get(i,j));
    //        
    //    }
    //  }
    op.image(raw,0,0,width,height,0,0,width,height);
    op.endDraw();
    op.updatePixels();
    op.save("back"+str(picg)+".png");

    //  raw = new PImage (HOR,VER);
    //  arraycopy(ax.pixels,raw.pixels);
    //  raw.resize(width,height);
  }


}

void keyPressed(){
  if (!online && key =='p'){

    showfullimg();
  } 

}
void draw(){

  // translate(-width/2,-height/2);
  if (key =='s')smooth();
  if (key =='S')noSmooth();
  textMode(MODEL);
  if (seedCountBool){
    itCount++;
  }
  // background(0,0.4,0.5,0.1);
  //background(233,23,23);
  raw = new PImage (HOR,VER);
  arraycopy(ax.pixels,raw.pixels);
  raw.resize(width,height);
  picg++;
  PGraphics op = createGraphics(width,height,P3D);
  op.loadPixels();
  op.beginDraw();
  if (raw!=null){
    //    for (int i=0; i<HOR; i++){
    //      for (int j=0; j<VER; j++){
    //        
    //       // op.set(i,j,raw.get(i,j));
    //        
    //    }
    //  }
    op.image(raw,0,0,width,height,0,0,width,height);
    op.endDraw();
    op.updatePixels();

    //arraycopy(op.pixels,mm.pixels);
  }
  background(op);
  // if (raw!=null && raw.width == width && raw.height == height)background(raw);
  //background(1);
  // showimg();
  //background(raw);
  scale(6);
  translate(-80,10,-90);
  rotateX(radians(45));
  // draw the boxes
  for (int i=0; i<HOR; i++){
    //  beginShape();
    for (int j=0; j<VER; j++){
      if ( particle[i][j][7] == 1){
        noStroke();
        //  fill(1,1,1,0.4);
        fill(233,23,23,205);
        pushMatrix();
        translate(particle[i][j][0],particle[i][j][1],particle[i][j][2]);
        ax.set(i,j,color(particle[i][j][0],particle[i][j][1],particle[i][j][2]));
        box(1,1,1);
        //  line3(particle[i][j][0],particle[i][j][1],particle[i][j][2]);
        stroke(1);
        popMatrix();
      }
    }
    // endShape();
  }
  fill(0.5,0.1,0.1);
  float Tension;
  int seedCount=0;
  // beginShape(QUADS);
  // find the forces for all the nodes except the boundary ones
  for (int i=1; i<HOR-1;i++){
    // beginShape();
    stroke(1);
    for (int j=1; j<VER-1; j++){
      if ( particle[i][j][7] == 1){
        seedCount=0;
        //***vectorsum**+=*spring_force***+***damping*****
        Tension = 0;
        if(particle[int(particle[i][j][8])][int(particle[i][j][9])][7]==1){
          rightNode[0] = particle[int(particle[i][j][8])][int(particle[i][j][9])][0];
          rightNode[1] = particle[int(particle[i][j][8])][int(particle[i][j][9])][1];
          rightNode[2] = particle[int(particle[i][j][8])][int(particle[i][j][9])][2];
          seedCount++;
        }
        else{
          rightNode[0]=rightNode[1]=rightNode[2]=0;
        }
        if(particle[int(particle[i][j][10])][int(particle[i][j][11])][7]==1){
          upNode[0] = particle[int(particle[i][j][10])][int(particle[i][j][11])][0];
          upNode[1] = particle[int(particle[i][j][10])][int(particle[i][j][11])][1];
          upNode[2] = particle[int(particle[i][j][10])][int(particle[i][j][11])][2];
          seedCount++;
        }
        else{
          upNode[0]=upNode[1]=upNode[2]=0;
        }
        if(particle[int(particle[i][j][12])][int(particle[i][j][13])][7]==1){
          leftNode[0] = particle[int(particle[i][j][12])][int(particle[i][j][13])][0];
          leftNode[1] = particle[int(particle[i][j][12])][int(particle[i][j][13])][1];
          leftNode[2] = particle[int(particle[i][j][12])][int(particle[i][j][13])][2];
          seedCount++;
        }
        else{
          leftNode[0]=leftNode[1]=leftNode[2]=0;
        }
        if(particle[int(particle[i][j][14])][int(particle[i][j][15])][7]==1){
          downNode[0] = particle[int(particle[i][j][14])][int(particle[i][j][15])][0];
          downNode[1] = particle[int(particle[i][j][14])][int(particle[i][j][15])][1];
          downNode[2] = particle[int(particle[i][j][14])][int(particle[i][j][15])][2];
          seedCount++;
        }
        else{
          downNode[0]=downNode[1]=downNode[2] = 0;
        }
        // stroke(1,1,1,0.4); 
        textFont(font,1.5); 
        //fill(233,23,23,205);
        if(rightNode[0] !=0){
          // noStroke();
          stroke(1); 
          line(particle[i][j][0],particle[i][j][1],particle[i][j][2],rightNode[0],rightNode[1],rightNode[2]); 

          stroke(1); 
          strokeWeight(1);
          Tension = 10*dist(particle[i][j][0],particle[i][j][1],particle[i][j][2],rightNode[0],rightNode[1],rightNode[2]);
          pushMatrix();
          translate((particle[i][j][0]+rightNode[0])/2,(particle[i][j][1]+rightNode[1])/2,(particle[i][j][2]+rightNode[2])/2);
          rotateX(PI/2);
          rotateY(-PI/2);
          //   line((particle[i][j][0]+rightNode[0])/2,(particle[i][j][1]+rightNode[1])/2,(particle[i][j][2]+rightNode[2])/2);
          text(int(Tension), 0,0,0);
          rotateX(radians(90));
          //  rect(0,0,5,5);
          stroke(1);
          line(0,0,0,0,0,(particle[i][j][2]+rightNode[2])/2);

          popMatrix();
        }
        if(upNode[0] !=0){
          line(particle[i][j][0],particle[i][j][1],particle[i][j][2],upNode[0],upNode[1],upNode[2]); 
          Tension = 10*dist(particle[i][j][0],particle[i][j][1],particle[i][j][2],upNode[0],upNode[1],upNode[2]);
          pushMatrix();
          translate((particle[i][j][0]+upNode[0])/2,(particle[i][j][1]+upNode[1])/2,(particle[i][j][2]+upNode[2])/2);
          rotateX(PI/2);
          rotateY(-PI/2);
          text(int(Tension), 0,0,0);
          popMatrix();
        }
        if(leftNode[0] !=0){
          line(particle[i][j][0],particle[i][j][1],particle[i][j][2],leftNode[0],leftNode[1],leftNode[2]); 
          Tension += dist(particle[i][j][0],particle[i][j][1],particle[i][j][2],leftNode[0],leftNode[1],leftNode[2]);
        }
        if(downNode[0] !=0){
          line(particle[i][j][0],particle[i][j][1],particle[i][j][2],downNode[0],downNode[1],downNode[2]);  //here
          Tension += dist(particle[i][j][0],particle[i][j][1],particle[i][j][2],downNode[0],downNode[1],downNode[2]);
        }
        particle[i][j][3] += k*((leftNode[0]+rightNode[0]+upNode[0]+downNode[0]-(seedCount*particle[i][j][0])-damping*particle[i][j][3]));
        particle[i][j][4] += k*((leftNode[1]+rightNode[1]+upNode[1]+downNode[1]-(seedCount*particle[i][j][1])-damping*particle[i][j][4]));
        particle[i][j][5] += k*((leftNode[2]+rightNode[2]+upNode[2]+downNode[2]-(seedCount*particle[i][j][2])-damping*particle[i][j][5]));
      }
      if (seedCount<2){
        particle[i][j][7]=0;
      } //kill off any nodes with only 1 neighbour (trees)

    }
    //   endShape();
  }
  // update the positions of the particles
  for (int i=0; i<HOR;i++){
    for (int j=0; j<VER; j++){
      if ( particle[i][j][7] == 1){
        particle[i][j][0] += particle[i][j][3];
        particle[i][j][1] += particle[i][j][4];
        particle[i][j][2] += particle[i][j][5];
      }
    }
  }

  // Saves each frame as line-0000.tif, line-0001.tif, etc.
  //saveFrame("line-####.jpg"); 
  if(itCount%20==0){
    int randI = int(random(1,HOR-1));
    int randJ = int(random(1,VER-1));
    if(particle[randI][randJ][7]==1){
      particle[randI][randJ][7] = 0;
    }
    // else{particle[randI][randJ][7] = 1;}
  }
  raw.resize(width,height);


  //loop();  // uncomment for offline use
  
  noStroke();


  translate(100,0,0);
  pictovect(raw, 255,false);
    translate(-210,0,0);
    pictovect(raw, 255,true);
    smooth();
  
//  loop();  // uncomment to save locally on hard drive
}


void mousePressed(){
  if(seedCountBool){
    seedCountBool = false;
  }
  else{
    seedCountBool = true;
  }
}





public void line2(float a, float b, float c, float a1, float b1,float c1){
  // beginShape(QUADS);
  noStroke();
  fill(233,23,23,205);
  vertex(a,b,c);
  vertex(a1,b1,c1);
  //  vertex(a+(a1-a),b,c);
  //  vertex(a+(a1-a),b+(b1-b),c1);
  //  vertex(a1,b+(b1-b),c1);
  // endShape(CLOSE);

}


public void line3(float a, float b, float c){
  vertex(a,b,c);

}

void pictovect(PImage img, int cthru,boolean dosmooth){
  noStroke();
if (dosmooth){
 smooth();
}

if (!dosmooth){
 noSmooth();
}
  for (int i=1; i<HOR-1;i++){
    beginShape(QUADS);
    
    // stroke(233,23,23,205);
    for (int j=1; j<VER-1; j++){
    //   rotateX(radians(0.2));
      color a= ax.get(i,j);
      fill(gr(a),gg(a),gb(a),cthru);
      vertex(gr(a),gg(a),gb(a));
      color b= ax.get(i-1,j);
      vertex(gr(b),gg(b),gb(b));
      color c= ax.get(i-1,j-1);
      vertex(gr(c),gg(c),gb(c));
      color d= ax.get(i,j-1);
      vertex(gr(d),gg(d),gb(d));

    }
    endShape();
    //    translate(0,0,.3);
    //    fill(1,155);
    //    
    //     beginShape(QUADS);
    //    // stroke(233,23,23,205);
    //    for (int j=1; j<VER-1; j++){
    //      color a= ax.get(i,j);
    //    //  fill(gr(a),gg(a),gb(a),cthru);
    //      vertex(gr(a),gg(a),gb(a));
    //      color b= ax.get(i-1,j);
    //      vertex(gr(b),gg(b),gb(b));
    //      color c= ax.get(i-1,j-1);
    //      vertex(gr(c),gg(c),gb(c));
    //      color d= ax.get(i,j-1);
    //      vertex(gr(d),gg(d),gb(d));
    //
    //    }
    //    endShape();
    //    translate(0,0,-.3);
  }


}

color gr(color c){
  color cc=0;
  cc = c >> 16 & 0xff;
  return cc; 
}

color gg(color c){
  color cc=0;
  cc = c >> 8 & 0xff;
  return cc; 
}

color gb(color c){
  color cc=0;
  cc = c & 0xff;
  return cc; 
}


