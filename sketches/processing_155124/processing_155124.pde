


String Names;
PShape[] alls;
PShape Seoul;


PShape Jongno ;
PShape Jung ;
PShape Yongsan ;
PShape Seongdong ;
PShape Gwangjin ;
PShape Dongdaemun ;
PShape Jungnang ;
PShape Seongbuk ;
PShape Gangbuk ;
PShape Dobong ;
PShape Nowon ;
PShape Eunpyeong ;
PShape Seodaemun ;
PShape Mapo ;
PShape Yangcheon ;
PShape Gangseo ;
PShape Guro ;
PShape Geumcheon ;
PShape Yeongdeungpo ;
PShape Dongjak ;
PShape Gwanak ;
PShape Seocho ;
PShape Gangnam ;
PShape Songpa ;
PShape Gangdong ;




int number = 0;
float zoomkey = 0.5;








void setup() {

  size(800, 800);
  smooth();
  background(0);


  
}

void draw(){
  background(20);
  noStroke();
  scale(zoomkey);


  Seoul = loadShape("seoulSvgs.svg");
  String[] Names = loadStrings("Chance.csv");



  for (int i = 0; i < Names.length; i++) {
    float[] values = float(split(Names[i], ","));    
    String[] codes = split(Names[i], ","); 

    println(codes[0], values[1], values[2]);
    


    if (values[1] == 11010) {

      PShape Jongno;
      Jongno = Seoul.getChild("Jongno-gu");
      fill(values[2]*10, 0, 0);
      Jongno.disableStyle();

      shape(Jongno, 0, 0);
    } else if (values[1] == 11020) {
      PShape Jung;
      Jung = Seoul.getChild("Jung-gu");
      fill(values[2]*10, 0, 0);
      Jung.disableStyle();

      shape(Jung, 0, 0);
    } else if (values[1] == 11030) {
      PShape Yongsan;
      Yongsan = Seoul.getChild("Yongsan-gu");
      fill(values[2]*10, 0, 0);
      Yongsan.disableStyle();

      shape(Yongsan, 0, 0);
    } else if (values[1] == 11040) {
      PShape Seongdong;
      Seongdong = Seoul.getChild("Seongdong-gu");
      fill(values[2]*10, 0, 0);
      Seongdong.disableStyle();

      shape(Seongdong, 0, 0);
    } else if (values[1] == 11050) {
      PShape Gwangjin;
      Gwangjin = Seoul.getChild("Gwangjin-gu");
      fill(values[2]*10, 0, 0);
      Gwangjin.disableStyle();

      shape(Gwangjin, 0, 0);
    } else if (values[1] == 11060) {
      PShape Dongdaemun;
      Dongdaemun = Seoul.getChild("Dongdaemun-gu");
      fill(values[2]*10, 0, 0);
      Dongdaemun.disableStyle();

      shape(Dongdaemun, 0, 0);
    } else if (values[1] == 11070) {
      PShape Jungnang;
      Jungnang = Seoul.getChild("Jungnang-gu");
      fill(values[2]*10, 0, 0);
      Jungnang.disableStyle();

      shape(Jungnang, 0, 0);
    } else if (values[1] == 11080) {
      PShape Seongbuk;
      Seongbuk = Seoul.getChild("Seongbuk-gu");
      fill(values[2]*10, 0, 0);
      Seongbuk.disableStyle();

      shape(Seongbuk, 0, 0);
    } else if (values[1] == 11090) {
      PShape Gangbuk;
      Gangbuk = Seoul.getChild("Gangbuk-gu");
      fill(values[2]*10, 0, 0);
      Gangbuk.disableStyle();

      shape(Gangbuk, 0, 0);
    } else if (values[1] == 11100) {
      PShape Dobong;
      Dobong = Seoul.getChild("Dobong-gu");
      fill(values[2]*10, 0, 0);
      Dobong.disableStyle();

      shape(Dobong, 0, 0);
    } else if (values[1] == 11110) {
      PShape Nowon;
      Nowon = Seoul.getChild("Nowon-gu");
      fill(values[2]*10, 0, 0);
      Nowon.disableStyle();

      shape(Nowon, 0, 0);
    } else if (values[1] == 11120) {
      PShape Eunpyeong;
      Eunpyeong = Seoul.getChild("Eunpyeong-gu");
      fill(values[2]*10, 0, 0);
      Eunpyeong.disableStyle();

      shape(Eunpyeong, 0, 0);
    } else if (values[1] == 11130) {
      PShape Seodaemun;
      Seodaemun = Seoul.getChild("Seodaemun-gu");
      fill(values[2]*10, 0, 0);
      Seodaemun.disableStyle();

      shape(Seodaemun, 0, 0);
    } else if (values[1] == 11140) {
      PShape Mapo;
      Mapo = Seoul.getChild("Mapo-gu");
      fill(values[2]*10, 0, 0);
      Mapo.disableStyle();

      shape(Mapo, 0, 0);
    } else if (values[1] == 11150) {
      PShape Yangcheon;
      Yangcheon = Seoul.getChild("Yangcheon-gu");
      fill(values[2]*10, 0, 0);
      Yangcheon.disableStyle();

      shape(Yangcheon, 0, 0);
    } else if (values[1] == 11160) {
      PShape Gangseo;
      Gangseo = Seoul.getChild("Gangseo-gu");
      fill(values[2]*10, 0, 0);
      Gangseo.disableStyle();

      shape(Gangseo, 0, 0);
    } else if (values[1] == 11170) {
      PShape Guro;
      Guro = Seoul.getChild("Guro-gu");
      fill(values[2]*10, 0, 0);
      Guro.disableStyle();

      shape(Guro, 0, 0);
    } else if (values[1] == 11180) {
      PShape Geumcheon;
      Geumcheon = Seoul.getChild("Geumcheon-gu");
      fill(values[2]*10, 0, 0);
      Geumcheon.disableStyle();

      shape(Geumcheon, 0, 0);
    } else if (values[1] == 11190) {
      PShape Yeongdeungpo;
      Yeongdeungpo = Seoul.getChild("Yeongdeungpo-gu");
      fill(values[2]*10, 0, 0);
      Yeongdeungpo.disableStyle();

      shape(Yeongdeungpo, 0, 0);
    } else if (values[1] == 11200) {
      PShape Dongjak;
      Dongjak = Seoul.getChild("Dongjak-gu");
      fill(values[2]*10, 0, 0);
      Dongjak.disableStyle();

      shape(Dongjak, 0, 0);
    } else if (values[1] == 11210) {
      PShape Gwanak;
      Gwanak = Seoul.getChild("Gwanak-gu");
      fill(values[2]*10, 0, 0);
      Gwanak.disableStyle();

      shape(Gwanak, 0, 0);
    } else if (values[1] == 11220) {
      PShape Seocho;
      Seocho = Seoul.getChild("Seocho-gu");
      fill(values[2]*10, 0, 0);
      Seocho.disableStyle();

      shape(Seocho, 0, 0);
    } else if (values[1] == 11230) {
      PShape Gangnam;
      Gangnam = Seoul.getChild("Gangnam-gu");
      fill(values[2]*10, 0, 0);
      Gangnam.disableStyle();

      shape(Gangnam, 0, 0);
    } else if (values[1] == 11240) {
      PShape Songpa;
      Songpa = Seoul.getChild("Songpa-gu");
      fill(values[2]*10, 0, 0);
      Songpa.disableStyle();

      shape(Songpa, 0, 0);
    } else if (values[1] == 11250) {
      PShape Gangdong;
      Gangdong = Seoul.getChild("Gangdong-gu");
      fill(values[2]*10, 0, 0);
      Gangdong.disableStyle();

      shape(Gangdong, 0, 0);
    }
  }
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == UP){
      zoomkey += 0.2;
    } else if(keyCode == DOWN){
      zoomkey -= 0.2;
    }
  }
}





//
//void draw() {
//
//  scale(.5);


//  Jongno  = Seoul.getChild("Jongno-gu");
//  Jung  = Seoul.getChild("Jung-gu");
//  Yongsan  = Seoul.getChild("Yongsan-gu");
//  Seongdong  = Seoul.getChild("Seongdong-gu");
//  Gwangjin  = Seoul.getChild("Gwangjin-gu");
//  Dongdaemun  = Seoul.getChild("Dongdaemun-gu");
//  Jungnang  = Seoul.getChild("Jungnang-gu");
//  Seongbuk  = Seoul.getChild("Seongbuk-gu");
//  Gangbuk  = Seoul.getChild("Gangbuk-gu");
//  Dobong  = Seoul.getChild("Dobong-gu");
//  Nowon  = Seoul.getChild("Nowon -gu");
//  Eunpyeong  = Seoul.getChild("Eunpyeong-gu");
//  Seodaemun  = Seoul.getChild("Seodaemun-gu");
//  Mapo  = Seoul.getChild("Mapo-gu");
//  Yangcheon  = Seoul.getChild("Yangcheon-gu");
//  Gangseo  = Seoul.getChild("Gangseo-gu");
//  Guro  = Seoul.getChild("Guro-gu");
//  Geumcheon  = Seoul.getChild("Geumcheon-gu");
//  Yeongdeungpo  = Seoul.getChild("Yeongdeungp-gu");
//  Dongjak  = Seoul.getChild("Dongjak-gu");
//  Gwanak  = Seoul.getChild("Gwanak-gu");
//  Seocho  = Seoul.getChild("Seocho-gu");
//  Gangnam  = Seoul.getChild("Gangnam-gu");
//  Songpa  = Seoul.getChild("Songpa-gu");
//  Gangdong  = Seoul.getChild("Gangdong -gu");



//
//  //jongno-gu
//  Jongno.disableStyle();
//  noFill();
//  stroke(255);
//  shape(Jongno, 0, 0);
//
//  //Jung-gu
//  Jung.disableStyle();
//  noFill();
//  stroke(255);
//  shape(Jung, 0, 0);
//}


