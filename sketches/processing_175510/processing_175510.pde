
PImage body = loadImage("body.png");
shirts[] Shirt = new shirts[8];
texts [] Text= new texts[16];
boolean locked = false;
String[] st = new String[500];
PFont fonti;


String username;



float bx;

float by;

int bs = 20;

boolean bover = false;

float bdifx = 0.0; 

float bdify = 0.0; 

void setup(){
  st[0]="Playboyize";
st[1]="Gigastrength";
st[2]="Deadlyinx";
st[3]="Techpill";
st[4]="Methshot";
st[5]="Methnerd";
st[6]="TreeEater";
st[7]="PackManBrainlure";
st[8]="Carnalpleasure";
st[9]="Sharpcharm";
st[10]="Snarelure";
st[11]="Skullbone";
st[12]="Burnblaze";
st[13]="Emberburn";
st[14]="Emberfire";
st[15]="Evilember";
st[16]="Firespawn";
st[17]="Flameblow";
st[18]="SniperGod";  
st[19]="TalkBomber";
st[20]="SniperWish";
st[21]="RavySnake";   
st[22]="WebTool";   
st[23]="TurtleCat";   
st[24]="BlogWobbles";   
st[25]="LuckyDusty";
st[26]="RumChicken";   
st[27]="StonedTime";       
st[28]="CouchChiller";           
st[29]="VisualMaster";           
st[30]="DeathDog";   
st[31]="ZeroReborn";                   
st[32]="TechHater";               
st[33]="eGremlin";           
st[34]="BinaryMan";
st[35]="AwesomeTucker";   
st[36]="FastChef";   
st[37]="JunkTop";
st[38]="PurpleCharger";   
st[39]="CodeBuns";   
st[40]="BunnyJinx";   
st[41]="GoogleCat";   
st[42]="StrangeWizard";
st[43]="Fuzzy_Logic";
st[44]="New_Cliche";
st[45]="Ignoramus";
st[46]="Stupidasole";
st[47]="whereismyname";
st[48]="Nojokur";
st[49]="Illusionz";
st[50]="Spazyfool";
st[51]="Supergrass";
st[52]="Dreamworx";
st[53]="Fried_Sushi";
st[54]="Stark_Naked";
st[55]="Need_TLC";
st[56]="Raving_Cute";
st[57]="Nude_Bikergirl";
st[58]="Lunatick";
st[59]="Garbage Can Lid";
st[60]="Crazy_Nice";
st[61]="Booteefool";
st[62]="Harmless_Venom";
st[63]="Lord_Tryzalot";
st[64]="Sir_Gallonhead";
st[65]="Boy_vs_Girl";
st[66]="MPmaster";
st[67]="King_Martha";
st[68]="Spamalot";
st[69]="Soft_member";
st[70]="girlDog";
st[71]="Evil_kitten";
st[72]="farquit";
st[73]="viagrandad";
st[74]="happy_sad";
st[75]="haveahappyday";
st[76]="SomethingNew";
st[77]="5mileys";
st[78]="cum2soon";
st[79]="takes2long";
st[80]="w8t4u";
st[81]="askme";
st[82]="Bidwell";
st[83]="massdebater";
st[84]="iluvmen";
st[85]="Inmate";
st[86]="idontknow";
st[87]="likme";
st[88]="lostmypassword";
st[89]="kizzmybutt";
st[90]="hairygrape";
st[91]="Poker_Star";
st[92]="2Star";
st[93]="Princess";
st[94]="Cool_guy";
st[95]="5th_angel";  
st[96]="CastBound";
st[97]="Twin_butterfly";
st[98]="LordOfMud";
st[99]="Angel_twins";
st[100]="Battledoom";
st[102]="Cute_sugar";
st[103]="Born2Pizza";
st[104]="Sugary_pie";
st[105]="DroolingOnU";
st[106]="Sugary_cake";
st[107]="WarlockOPain";
st[108]="Pie_sweetness";
st[109]="Greek-God";
st[110]="Angel_candy";
st[111]="Entertain-me";
st[112]="Angel_Doll";
st[113]="Romeo";
st[114]="Angel-Friend";
st[115]="Genius-General";
st[116]="Angel_Cherub";
st[117]="Lord-voldemort";
st[118]="Angel3Goldfish";
st[119]="Kunning-king";
st[120]="AngelGirl";
st[121]="Born-confused";
st[122]="AngelHoneybear";
st[123]="e4envy";
st[124]="Angel.Memories";
st[125]="Meat.Duck";
st[126]="AngelMunchkin";
st[127]="Popoff";
st[128]="Angel-Lamb";
st[129]="Mistalee";
st[130]="Angel-Snowflakes";
st[131]="Jaycee";
st[132]="Apple.Honeypie";
st[133]="Max";
st[134]="Angel-Sweet-Lips";
st[135]="FuNkY mOnEy";
st[136]="Angelberry";
st[137]="Wokie";
st[138]="AngelFroggie";
st[139]="Pokie";
st[140]="AngelWonderland";
st[141]="LilOkie";
st[142]="AngelSweetiePie";
st[143]="WhackAttack";
st[144]="AngelWonderland";
st[145]="Brads";
st[146]="Angel.Cherub";
st[147]="Manic Psycho";
st[148]="Angel-Doll";
st[149]="PoPkiss";
st[150]="Awesome-girls";
st[151]="BadAss";
st[152]="Awesome_angel";
st[153]="Afro-head";
st[154]="AwesomeChocolate";
st[155]="meN@ citY";
st[156]="Awesome-pie";
st[157]="Glow‘n’Show";
st[158]="Awesome_lavender";
st[159]="Gozmit";
st[160]="BeeBuckshot";
st[161]="Beloved";
st[162]="Fiddlesticks";
st[163]="Babykins";
st[164]="SquirrelNuts";
st[165]="bearhugs";
st[166]="BullFrog";
st[167]="Beautiful";
st[168]="DogBone";
st[169]="Beauty";
st[170]="Dixie";
st[171]="Bear";
st[172]="Godfather";
st[173]="Babykins";
st[174]="Hangman";
st[175]="Blossom";
st[176]="CyberWarrior";
st[177]="Bubbles";
st[178]="CyberKing";
st[179]="Buttercup";
st[180]="Exotica";
st[181]="Brownie";
st[182]="Oblivion";
st[183]="Bubbly";
st[184]="Candy Cane";
st[185]="Beautiful_doll"; 
st[186]="Cybertron";
st[187]="Bliss";
st[188]="SmartGeek";
st[189]="Bubblegum";
st[190]="Hypnosis";
st[191]="Butterscotch";
st[192]="NetFreak";
st[193]="Charming";
st[194]="The Prophet";
st[195]="chiquitita";
st[196]="CyberGypsy";
st[197]="Cookie";
st[198]="Pill Head";
st[199]="Cheeky_girl";
st[200]="Technophyle";
st[201]="Classy_girl";
st[202]="Neurotic";
st[203]="Cool_bubble";
st[204]="Pegasus";
st[205]="Cool_dora";
st[206]="CoreFinder";
st[207]="Cool-pineapple";
st[208]="Death Nut";
st[209]="Cool_strawberry";
st[210]="Wild-Born";
st[211]="Cozy_button";
st[212]="HockeyWain";
st[213]="Crazy";
st[214]="Tech_Bro";
st[215]="Cherub";
st[216]="Mind_Probe";
st[217]="Cutie";
st[218]="Little-Trout";
st[219]="Cutesy";
st[220]="Couldnt_Find_Good_Name";
st[221]="Cuteness";
st[222]="Twister";
st[223]="Cupid";
st[224]="Ice-Geek";
st[225]="Cute";
st[226]="GreenCore";
st[227]="Cupcake";
st[228]="Technophyle";
st[229]="Cutlet";
st[230]="Code_Hacker";
st[231]="Dr.Angel";
st[232]="Bronze_Gamer";
st[234]="Delicious";
st[235]="Brain Dead";
st[236]="Divine";
st[237]="OrdinaryGentelman";
st[238]="Dimples";
st[239]="Metalhead";
st[240]="Dream_girl";
st[241]="OverKill";
st[242]="Dove-girl";
st[243]="Short-Circuit";
st[244]="Dear.angel";
st[245]="Mr.America";
st[246]="DearSweetie";
st[247]="Raging-Again";
st[248]="Diamond-girl";
st[249]="Random-Burglar";
st[250]="Doodles";
st[251]="Black-Hawk";
st[252]="Dolly";
st[253]="Hitch-Hiker";
st[254]="Doll";
st[255]="Strange_Evil";
st[256]="Diva_hot";
st[257]="Cashed-Jerk";
st[258]="Doll_beautiful";
st[259]="Strange_Evil";
st[260]="Dandy";
st[261]="Non_Sane";
st[262]="Emerald-Princess";
st[263]="Brutal";
st[264]="Enchanted";
st[265]="Soul-Taker";
st[266]="Epic_angel";
st[267]="Tan-Stallion";
st[268]="Fabulous";
st[269]="The.Dude";
st[270]="Flower";
st[271]="Take.Away";
st[272]="Fluffy";
st[273]="Suicid_Jockey";
st[274]="Forever_angel";
st[275]="Swerve";
st[276]="Fancy-doll";
st[277]="angel";
st[278]="glitch";
st[279]="Swampmasher";
st[280]="Fairy_hot";
st[281]="CouchKing";
st[282]="Foxy";
st[283]="SkullCrusher";
st[284]="Glamorous-angel";
st[285]="Broomspun";
st[286]="Glimmers";
st[287]="ChocolateThunder";
st[288]="Gorgeous.sweetie";
st[289]="CoolWhip";
st[290]="Goddess";
st[291]="Crashtest";
st[292]="Glowing";
st[293]="Crash_Override";
st[294]="Glitter";
st[295]="Day_Hawk";
st[296]="Girly";
st[297]="Dark_Horse";
st[298]="Happiness";
st[299]="Kingdom_Warrior";
st[300]="Hiphop";
st[301]="Mindless_Bobcat";
st[302]="Honey";
st[303]="Mr.Lucky";
st[304]="Heavenly";
st[305]="Neophyte-Believer";
st[306]="Heart";
st[307]="Sidewalk_Enforcer";
st[308]="Happy";
st[309]="Sky_Bully";
st[310]="Honeycomb";
st[311]="Tacklebox";
st[312]="Honeycake";
st[313]="Happy Jock";
st[314]="Honeybear";
st[315]="Thrasher";
st[316]="Hotcakes";
st[318]="Howling_Swede";
st[319]="Honey_Bell";
st[320]="Troubadour";
st[321]="Honey_Buttercup";
st[322]="Twitch";
st[323]="Honey_Cake_Dumpling";
st[324]="Turnip_King";
st[325]="Honey_Butterfly";
st[326]="Waylay_Dave";
st[327]="Honey_Cake_Munchkin";
st[328]="Scarface";
st[329]="Honey_Doll";
st[330]="American_Bad@$$";
st[331]="Honey-Goldfish";
st[332]="Manic-Depressive";
st[333]="Honey-Girl";
st[334]="SecretAgent";
st[335]="Honey-Blossom-Dimples";
st[336]="Bugger";
st[337]="Honey-Angelhearts";
st[338]="CoohlWhip";
st[339]="Honey.Stars.SunshineXXX";
st[340]="CrazyXEights";
st[341]="HoneyXStarsXTwinkles";
st[342]="Commando";
st[343]="HoneyXSweetXLips";
st[344]="Chuckles";
st[345]="Honey-bean-Angel";
st[346]="Cross-Thread";
st[347]="Honey.bear.Cheers";
st[348]="CrissCross";
st[349]="HoneybearDoll";
st[350]="xXCerealKillerXx";
st[351]="HoneyPearls";
st[352]="Dredd";
st[353]="Honey.bearSunflower";
st[354]="Dr. Cocktail";
st[355]="Snowflakes";
st[356]="Fastdraw";
st[357]="Blossom";
st[358]="Gunhawk";
st[359]="HoneyGirl";
st[360]="HogButcher";
st[361]="HaggyPie";
st[362]="Guillotine";
st[363]="HinnyPie";
st[364]="Esquire";
st[365]="Internet.Monster";
st[366]="ElectricPlayer";
st[367]="InternetPrincess";
st[368]="Hyper";
st[369]="Inspiration";
st[370]="Little Cobra";
st[371]="Jellybeans";
st[372]="Manimal";
st[373]="Jolly";
st[374]="Married_Man";
st[375]="Jelly";
st[376]="Midnight Rider";
st[377]="JellyBeanBrownies";
st[378]="Midnight_Rambler";
st[379]="Kitty";
st[380]="Cruiser";
st[381]="Kisses";
st[382]="Black_Sheep";
st[383]="Kitty-Angel";
st[384]="Marshmallow_Man";
st[385]="Kitty-Melody";
st[386]="Greek_Goat";
st[387]="Lemon-Honeypie";
st[388]="Macho_Moron";
st[389]="Lil-Flower";
st[390]="Hellboy";
st[391]="Lil.Miss.Silly";
st[392]="Bean_Basket";
st[393]="LilPuppyDog";
st[394]="Mr.Peppermint";
st[395]="LimeGreenSoda";
st[396]="Natural_Mess";
st[397]="Little_Gummy_Bear";
st[399]="Nightmare.x.King";
st[400]="Little-Miss-Cupcake";
st[401]="Old_Regret";
st[402]="Little-Miss_Piggy";
st[403]="Prometheus";
st[404]="LivePink";
st[405]="Pluto";
st[406]="Lollipop_Honey_Bear";
st[407]="RifRaf";
st[408]="Lollipop_Princess";
st[409]="Pinball-Wizard";
st[410]="Love-Pink";
st[411]="Papa_Smurf";
st[412]="Love_Hearts<3";
st[413]="Pogue";
st[414]="Marshmallow.Honey";
st[415]="Psycho_Thinker";
st[416]="Muffinhead";
st[417]="Rooster";
st[418]="Muffins";
st[419]="Roadblock";
st[420]="Monster";
st[421]="Sandbox";
st[422]="Melody";
st[423]="Foxer";
st[424]="Nightingale";
st[425]="Scrapper";
st[426]="Oodles";
st[427]="Ultimate_Shooter";
st[428]="Orange_Splash";
st[429]="Screwtape";
st[430]="Peach";
st[431]="Snow Hound";
st[432]="Passion";
st[433]="Squatch";
st[434]="Passion-Fruit";
st[435]="Tacklebox";
st[436]="Peace_Dude";
st[437]="High Beam";
st[438]="Penguin-Doll";
st[439]="VirusForever";
st[440]="Peppermint0Candy";
st[441]="copilot";
st[442]="Peppermint_Kisses";
st[443]="deano";
st[444]="Perfect_Harmony";
st[445]="Squirtv";
st[446]="Piggy-Honeybear";
st[447]="Sandstorm";
st[448]="Pink_Award";
st[449]="Golden-Panther";
st[450]="PinkDoll";
st[451]="imarcore";
st[452]="Pink_Garden";
st[453]="Sandbox";
st[454]="Pink_Lover";
st[455]="Slow_Trot";
st[456]="Queen_Honey_Blossom";
st[457]="Sexual_Chocolate";
st[458]="Rainbow-Blooms";
st[459]="Yellow-Menace";
st[460]="Rainbow-Colours";
st[461]="Zero_Charisma";
st[462]="Rainblow.Bubbles";
st[463]="Flying_Mouse";
st[464]="Rainbow-Doll";
st[465]="Zesty_Dragon";
st[466]="RainbowForest";
st[467]="Zod";
st[468]="Rainbow-Kitty";
st[469]="Screwtape";
st[470]="Rainbow-Pearls";
st[471]="Scrapper";
st[472]="Shiny_Seashells";
st[473]="SilverGun";
st[474]="ShyxxxDoll";
st[475]="Roxrite";
st[478]="Silly_Ninja";
st[479]="CrazyTroll";
st[480]="Silly-Pie";
st[481]="Silvermoon";
st[482]="Smilee-Doll";
st[483]="Roblox";
st[484]="Smilee_Love";
st[485]="NoisYBoY";
st[486]="Smiley-Doll";
st[487]="Mutt";
st[488]="Snow-Angel";
st[489]="Kozmo";
st[490]="Snow.Princess";
st[491]="Foxface";
st[492]="StarryAngel";
st[493]="Toxic";
st[494]="Strawberry.Applepie";
st[495]="Blonde_Bond";
st[496]="Sugar_Hugs";
st[497]="Ridge_Runner";
st[498]="Twinkie_Star";
st[499]="Flyswat";
  size(1200,1300);
  

  //frameRate(10);
  Shirt[0] = new shirts("bls.png", "1",0,0);
  Shirt[1] = new shirts("bs.png", "1",0,150);
  Shirt[2] = new shirts("gs.png", "1",0,300);
  Shirt[3] = new shirts("gs2.png", "1",0,450);
  Shirt[4] = new shirts("ms.png", "1",0,600);
  Shirt[5] = new shirts("ps.png", "1",0,750);
  Shirt[6] = new shirts("pus.png", "1",0,900);
  Shirt[7] = new shirts("ts.png", "1",0,1050);
  
  Text[0] = new texts("t0.png", "2",750,450);
  Text[1] = new texts("t1.png", "2",750,500);
  Text[2] = new texts("t2.png", "2",750,550);
  //Text[3] = new texts("t3.png", "2",750,600);
  Text[4] = new texts("t4.png", "2",750,650);
  Text[5] = new texts("t5.png", "2",750,700);
  Text[6] = new texts("t6.png", "2",750,750);
  Text[7] = new texts("t7.png", "2",750,800);
  Text[8] = new texts("t8.png", "2",750,850);
  Text[9] = new texts("t9.png", "2",750,900);
  Text[10] = new texts("t10.png", "2",750,250);
  Text[11] = new texts("t11.png", "2",750,200);
  Text[12] = new texts("t12.png", "2",750,350);
  Text[13] = new texts("t13.png", "2",750,400);
  Text[14] = new texts("t14.png", "2",750,600);
  Text[15] = new texts("t15.png", "2",750,300);
  Text[3] = new texts("t16.png", "2",750,150);

  fonti=createFont("fantasy");
  textFont(fonti,80);
  int i = Math.floor(random(499));
  username = st[i];
  console.log(username);
  console.log(i);
 
  
  
}

void draw() { 
  background(255);
  console.log(username);
  fill(154);
  rect(0,0,300,1300);
  fill(200);
  rect(740,125,310,900);
 fill(0);
   text(username, 500,100);
  image(body,300,0);
  for(int i =0; i<Shirt.length; i++){
     
    if(mouseX> Shirt[i].getX() && mouseX < (Shirt[i].getX()+275) && mouseY > Shirt[i].getY() && mouseY < (Shirt[i].getY()+308)){
     
      Shirt[i].setOver(true);
      //console.log(i);
      if(!Shirt[i].getLocked());
      else{
        Shirt[i].setOver(false);
      }
    }
    else{Shirt[i].setOver(false);}
    
   image(Shirt[i].getImage(), Shirt[i].getX(), Shirt[i].getY());
  
  } 
  for(int i =0; i<Text.length; i++){
     
    if(mouseX> Text[i].getX() && mouseX < (Text[i].getX()+100) && mouseY > Text[i].getY() && mouseY < (Text[i].getY()+50)){
     
      Text[i].setOver(true);
      console.log(i);
      console.log(Text[i].getX());
      if(!Text[i].getLocked());
      else{
        Text[i].setOver(false);
      }
    }
    else{Text[i].setOver(false);}
    
   image(Text[i].getImage(), Text[i].getX(), Text[i].getY());
  
  } 
  
}
 
void mousePressed(){
  for(int i = 0; i<Shirt.length; i++){
    if(Shirt[i].getOver()){
      Shirt[i].setLocked(true);
    }
    else{
      Shirt[i].setLocked(false);
    }
    Shirt[i].setbdifx(mouseX-Shirt[i].getX());
    Shirt[i].setbdify(mouseY-Shirt[i].getY());
  }
  for(int i = 0; i<Text.length; i++){
    if(Text[i].getOver()){
      Text[i].setLocked(true);
    }
    else{
      Text[i].setLocked(false);
    }
    Text[i].setbdifx(mouseX-Text[i].getX());
    Text[i].setbdify(mouseY-Text[i].getY());
  }
}

void mouseDragged() {
  for(int i = 0; i<Shirt.length;i++){
    if(Shirt[i].getLocked()){  
      Shirt[i].setX(mouseX-Shirt[i].getbdifx());
      Shirt[i].setY(mouseY -Shirt[i].getbdify());
    }
   }
   
  for(int i = 0; i<Text.length;i++){
    if(Text[i].getLocked()){  
      Text[i].setX(mouseX-Text[i].getbdifx());
      Text[i].setY(mouseY -Text[i].getbdify());
    }
   }
}

void mouseReleased(){
  for(int i = 0; i < Shirt.length;i++){
    Shirt[i].setLocked(false); 
  }
  for(int i = 0; i < Text.length;i++){
    Text[i].setLocked(false); 
  }
}


class shirts{
  Type tt;
  PImage img;
  int x;
  int y;
  int bdifx;
  int bdify;
  boolean locked;
  boolean over;
  shirts(String imgi,Type t,int xi, int yi){
    img=loadImage(imgi);
    tt = t;
    x = xi;
    y = yi;
    
  }
  PImage getImage(){
    return img;
  }
  void setX(int xi){
    x = xi;
  }
  void setY(int yi){
    y = yi;
  }
  int getX(){
    return x;
  }
  int getY(){
    return y;
  }
  int getbdifx(){
    return bdifx;
  }
  int getbdify(){
    return bdify;
  }
  void setbdifx(int bifx){
    bdifx = bifx;
  }
  void setbdify(int bify){
    bdify= bify;
  }
  boolean getLocked(){
    return locked;
  }
  void setLocked(boolean lockie){
    locked = lockie;
  }
  boolean getOver(){
    return over;
  }
  void setOver(boolean ovie){
    over = ovie;
  }
}

class texts{
  Type tt;
  PImage img;
  int x;
  int y;
  int bdifx;
  int bdify;
  boolean locked;
  boolean over;
  texts(String imgi,Type t,int xi, int yi){
    img=loadImage(imgi);
    tt = t;
    x = xi;
    y = yi;
    
  }
  PImage getImage(){
    return img;
  }
  void setX(int xi){
    x = xi;
  }
  void setY(int yi){
    y = yi;
  }
  int getX(){
    return x;
  }
  int getY(){
    return y;
  }
  int getbdifx(){
    return bdifx;
  }
  int getbdify(){
    return bdify;
  }
  void setbdifx(int bifx){
    bdifx = bifx;
  }
  void setbdify(int bify){
    bdify= bify;
  }
  boolean getLocked(){
    return locked;
  }
  void setLocked(boolean lockie){
    locked = lockie;
  }
  boolean getOver(){
    return over;
  }
  void setOver(boolean ovie){
    over = ovie;
  }
}
    
  
  


