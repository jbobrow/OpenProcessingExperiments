
HashMap scene;  // HashMap object
String curPos="1";
int curY=60;
int YStep=25;
PFont fontA;
color colA, colK;
int end=0;
void setup() {
  size(800, 360);
  scene = new HashMap();
  setupSceneText();
  fontA = loadFont("BaskervilleItalicWin95BT-14.vlw");
  textFont(fontA, 14);
  colA=color(50, 80, 170);
  colK=color(150, 80, 50);
  text("Hikayeyi devam ettirmek için sağ sol ok tuşlarını kullanın", 30, 20);
  text("Sol ok ortamı kızdırır, sağ ok yumuşatır", 30, 40);

  noLoop();
}

void draw() {
  if (curPos.length()%2==0) fill(colA);
  if (curPos.length()%2==1) fill(colK);
  
  String s=scene.get(curPos).toString();
  text(s, 30, curY);

}

void keyPressed() {

  if (keyCode == LEFT) {
    curPos=curPos+"1";
  } 
  if (keyCode == RIGHT) {
    curPos=curPos+"2";
  }
  curY+=YStep;
  
  if (scene.containsKey(curPos)==false){
    fill(255);
    //saveFrame("hikaye-####.png");
    curPos="1";
    curY=60;
    background(200);
    text("Hikayeyi devam ettirmek için sağ / sol ok tuşlarını kullanın", 30, 20);
    text("Sol ok ortamı kızdırır, sağ ok yumuşatır", 30, 40);
    
  }
  redraw();
}

void setupSceneText() {
  scene.put("1", "Ormanda karınca kışa hazırlık yapıyordu ve ağustos böceği bu sırada gitar çalıyordu , bunu gören karınca ağustos böceğine derki;");
  scene.put("11", "Kalksana ulan ayı ne bok yapıyorsun orada kış geliyor.");
  scene.put("12", "Mümin kardeşim kış geliyor neden çalışmıyorsun ve neden yiyecek depolamıyorsun?");
  scene.put("111", "Sanamı sorucam lale istediğimi yaparım !");
  scene.put("112", "Kabalaşmana gerek yok hallederim ben canım.");
  scene.put("121", "Senin gibi boş boş çalışıp ne yapıcam böyle iyi.");
  scene.put("122", "Tabi ama ben kış için ne yapacağımı bilmiyorum.");
  scene.put("1111", "Seni bir severim! bir daha kimse sevemez.");
  scene.put("1112", "Tamam ben karışmıyorum ama çalışmanı tavsiye ederim.");
  scene.put("1121", "Sen gerizekalısın sülale aptalı kışın ananı babanı yede gör ebeninkini.");
  scene.put("1122", "Sen çok delikanlı adamsın aslen nerelisin ?");
  scene.put("1211", "Sen böyle otur götünü büyüt sana karışmıyorum.");
  scene.put("1212", "Ama böyle yapma ben senin iyiliğini düşünüyorum.");
  scene.put("1221", "Sen böyle yat olum kışın sıçtın sen bunu bilmiş ol.");
  scene.put("1222", "Peki sen bilirsin.");
  scene.put("11111", "Olum mal geldin mal gidiceksin ha !");
  scene.put("11112", "Sizinle aynı ortamda bulunamıcam lütfen.(HOS)");
  scene.put("11121", "Tamam tamam bakarız kral.(MS)");
  scene.put("11122", "Teşekkür ederim balım.");
  scene.put("11211", "Sen ne ana bacı yapıyosun ulan tırrik.(Karınca 36 yerinden bıçaklanarak ölür FMS)");
  scene.put("11212", "Tamam görüşürüz.");
  scene.put("11221", "Sanane ulan ayı.");
  scene.put("11222", "Aşağı verenler sen nerdensin ?");
  scene.put("12121", "Düşünme sanane ne olacak bana!(MS)");
  scene.put("12122", "Bu kadar çok iyiliğimi düşünen olmadı.");
  scene.put("12211", "Sen sıçmışsın!");
  scene.put("12212", "Yok aslında benim kış için çok iyi planlarım var.");
  scene.put("12221", "Ben bilirim tabi, sana da bir yüz verdik hemen yavşadın.");
  scene.put("12222", "Bu arada çalışkan olduğun kadar da güzelsin.");
  scene.put("111111", "Sen ne konuşuyorsun lan değişik! Aaa taş , ahanda kafası yarıldı…");
  scene.put("111112", "Mal derken çok seksi oluyorsun, bana mal de ağustos böceği !");
  scene.put("111211", "Çok yavşadın bana, annem göster ama elletme dedi!");
  scene.put("111222", "Ben teşekkür ederim, sanırım sana aşık oldum! Benimle evlenir misin?");
  scene.put("112221", "Sanane ne yapacaksın lan ayı.(HOS)");
  scene.put("112222", "Aaa bende , yoksa biz kardeş miyiz?");
  scene.put("121221", "Düşünmez tabi hayvan gibi herifsin 7/24 yatıyorsun!");
  scene.put("121222", "Bana da bu kadar sıcak kimse gelmedi.");
  scene.put("122121", "İşim var.(HOS)");
  scene.put("122122", "Planım yok benim, balayı yapalım mı?(ES)");
  scene.put("122211", "Hayır ne yavşaması dedem kılıklı herif!(HOS)");
  scene.put("122212", "Yavşarım tabi böyle seksi yaradılışa. Yürüyen cinsellik  oyşşhhh!(PİS-S)");
  scene.put("122221", "Ne güzeli be ? Sende beni öbür karıncalar gibi mi zannettin, ben senin karıncalardan değilim!");
  scene.put("122222", "Gerçekten mi?");
  scene.put("1111111", "Ağustos böceği karıncayı elindeki gitarla öldürüp kayıplara karışır…(FMS)");
  scene.put("1111112", "Ağustos böceği tam bir şey söyleyecek iken bu tartışmalara dayanamayıp felç olur…(FOS)");
  scene.put("1111121", "Ağustos böceği aslında sapıktır , bu hareket onu azdırır ve karıncaya tecavüz ettikten sonra hunharca öldürür…(PİS-S)");
  scene.put("1111122", "Ağustos böceği sende der ve o gecenin meyvesini bir ay sonra alırlar…(MES)");
  scene.put("1112221", "Hayır senin gibi bir ayı ile  mi evleneceğim der ve def eder…(HOS)");
  scene.put("1112222", "Kabul ediyorum der ağustos böceği ve karınca Amsterdam belediye başkanı tarafından kıyılan nikah ile dünya evine girerler…(MES)");
  scene.put("1212211", "Bu lafı duyunca yediremeyen ağustos böceği karıncayı öldürür…(HS)");
  scene.put("1212212", "Hayır öyle değil , yanlış anladın beni der ve bu üzüntüye dayanamayıp felç olur…(FOS)");
  scene.put("1212221", "Git kalorifer böceğiyle tanış der…(HOS)");
  scene.put("1212222", "Bu durumdan faydalanan ağustos böceği  evlenme teklif eder ve kabul edilir…(ES)");
  scene.put("1222211", "Evet yalan söyledim götümün kenarı.");
  scene.put("1222212", "O anlamda demedim kendimi affettirebilir miyim?");
  scene.put("1222221", "Yok gülerken götüme benziyosun der…(HOS)");
  scene.put("1222222", "Evet benimle aksam arkadaki ağaçta buluşur musun?");
  scene.put("12222111", "Çokta şeyimde ne yaparsan yap ayı oğlu ayı der…(HOS)");
  scene.put("12222112", "Ama ben çok hayal kurdum.");
  scene.put("12222121", "Hayır der...(MS)");
  scene.put("12222122", "Evet  ");
  scene.put("12222221", "Hayır…(TS)");
  scene.put("12222222", "Evet.");
  scene.put("122221121", "Ben kurmamıştım der ve yol verir karıncaya.(HOS)");
  scene.put("122221122", "Bende kurmuştum der ve evlenme teklif eder…(MES)");
}


