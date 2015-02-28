

String scan="";


int NamenAnzahl= 11, KategorienAnzahl= 5, ZeitschriftenAnzahl= 5, MaterialienAnzahl= 6, DigitaleAnzahl= 5, HardwareAnzahl= 3;
int BuecherAnzahl=10;
PImage img, imgIn, imgOut;
PImage imgInhalt, imgKommentare, imgInfos, imgLeihliste, imgHinzufuegen, imgBuchHinzufuegen;
PImage[]Namenimages = new PImage[NamenAnzahl];
PImage[]Kategorienimages= new PImage[KategorienAnzahl];
PImage[]Zeitschriftenimages= new PImage[ZeitschriftenAnzahl];
PImage[]Materialienimages= new PImage[MaterialienAnzahl];
PImage[]Digitaleimages= new PImage[DigitaleAnzahl];
PImage[]Hardwareimages= new PImage[HardwareAnzahl];
int XPressed, YPressed, XReleased, YReleased;
int AKategorie=0 , ABuch=0;
int Namenzaehler= 0, Kategorienzaehler= 0, Zeitschriftenzaehler= 0, Materialienzaehler= 0, Digitalezaehler=0, Hardwarezaehler=0 ;
boolean ausgeliehen= false;
boolean hinzuMouse= false;
int hinzu = 0;

boolean [][] leihlist = new boolean[KategorienAnzahl][BuecherAnzahl];
int [][] Nleihlist = new int[KategorienAnzahl][BuecherAnzahl];
String [] Namen = new String[NamenAnzahl];
String [] BuchTitel = new String[BuecherAnzahl*KategorienAnzahl];


void setup() {

  size(320, 568);
  int index;
  String lines[] = loadStrings("leihlist.txt"); 
  String Nlines[] = loadStrings("Nleihlist.txt"); 
  String Namen1[] = loadStrings("Namen.txt"); 
  String BuchTitel1[] = loadStrings("BuchTitel.txt"); 

  img = loadImage("RondellHintergrund.jpg");
  imgIn = loadImage("AusleihenButton.jpg");
  imgOut = loadImage("Zurueckgeben.jpg");
  imgInhalt = loadImage("InhaltBuch.jpg");
  imgKommentare= loadImage("KommentareBuch.jpg");
  imgInfos= loadImage("PInformation.jpg");
  imgLeihliste= loadImage("Leihliste.jpg");
  imgHinzufuegen= loadImage("Hinzufugen.jpg");
  imgBuchHinzufuegen= loadImage("BuchHinzufuegen.jpg");


  for (int i=0;i<KategorienAnzahl;i++) {
    for (int j=0;j<BuecherAnzahl;j++) {
      index = i*BuecherAnzahl + j;
      Nleihlist[i][j]=int(Nlines[index]);
      if(int(lines[index]) == 0)
      {
        leihlist[i][j]=false;
      }
      else
      {
        leihlist[i][j]=true;        
      }
      println(Nlines[index]);
    }
  }
  for (int i=0;i<NamenAnzahl;i++) Namen[i]=Namen1[i];
  for (int i=0;i<BuecherAnzahl*KategorienAnzahl;i++) BuchTitel[i]=BuchTitel1[i];
  for (int i=0;i<Namenimages.length;i++) {
    Namenimages[i]=loadImage (i+"Namen.jpg");
  }
  for (int j=0;j<Kategorienimages.length;j++) {
    Kategorienimages[j]=loadImage (j+"Kategorien.jpg");
  }
  for (int k=0;k<Zeitschriftenimages.length;k++) {
    Zeitschriftenimages[k]=loadImage (k+"Zeitschriften.jpg");
  }
  for (int l=0;l<Materialienimages.length;l++) {
    Materialienimages[l]=loadImage (l+"Materialien.jpg");
  }
  for (int m=0;m<Digitaleimages.length;m++) {
    Digitaleimages[m]=loadImage (m+"Digital.jpg");
  }
  for (int n=0;n<Hardwareimages.length;n++) {
    Hardwareimages[n]=loadImage (n+"Hardware.jpg");
  }
}

void draw() {
  
  switch(hinzu)
  {
    case 0:

  image(img, 0, 0, 320, 568);
  image(Namenimages[Namenzaehler], 0, 419, 320, 146);
  image(Kategorienimages[Kategorienzaehler], 0, 54, 320, 71);
  int numPlus, numMinus;


  if (Kategorienzaehler== 4) {
    image(Zeitschriftenimages[Zeitschriftenzaehler], 0, 130, 320, 220);
  }
  if (Kategorienzaehler== 2) {
    image(Materialienimages[Materialienzaehler], 0, 130, 320, 220);    
    
  }
  if (Kategorienzaehler== 0) {
    image(Digitaleimages[Digitalezaehler], 0, 130, 320, 220);
  }
  if (Kategorienzaehler== 1) {
    image(Hardwareimages[Hardwarezaehler], 0, 130, 320, 220);
 
    //println(Digitalezaehler);
  }

  if(leihlist[Kategorienzaehler][ABuch])
  {
    image(imgOut, 0, 347.5, 320, 70);
  }
  else {
    image(imgIn, 0, 347.5, 320, 70);
  }
  
   if(mouseX>77 && mouseX<149 && mouseY>319 && mouseY<339){
  image(imgInhalt,0,54,320,293);
  }
  if(mouseX>169 && mouseX<241 && mouseY>319 && mouseY<339){
  image(imgKommentare,0,54,320,293);
      if(leihlist[Kategorienzaehler][ABuch]){
        fill(0);
  text("ausgeliehen von:",90,280);
  //index=int(Nleihlist[Kategorienzaehler*BuecherAnzahl+ABuch]);
  text(Namen[Nleihlist[Kategorienzaehler][ABuch]],90,300);

  }
  }
  if(mouseX>77 && mouseX<149 && mouseY>428 && mouseY<448){
  image(imgInfos,0,419,320,150);
  fill(0);
    text(Namen[Namenzaehler],140,555);
  }
    break;
    case 1:
    
    image(imgHinzufuegen,-1,0,320,568);
    
    if(mouseX>125 && mouseX<195 && mouseY>200 && mouseY<290){
    image(imgBuchHinzufuegen,0,0,320,568);
    }
    
    break;
    
  
  

  }
  if(mouseX>169 && mouseX<241 && mouseY>428 && mouseY<448){
  float yJezt=475;
  
   image(imgLeihliste,0,419,320,150);
   fill(0);
    text(Namen[Namenzaehler],140,555);
   
  for (int i=0;i<KategorienAnzahl;i++) {
    for (int j=0;j<BuecherAnzahl;j++) {
      if(Nleihlist[i][j]==Namenzaehler){
         text(BuchTitel[i*BuecherAnzahl+j],100,yJezt);
         yJezt+=15;
      }
    }
  }
     
        
  }
}



void mousePressed() {

  XPressed = mouseX;
  YPressed = mouseY;

  if (mouseX>87 && mouseX<229 && mouseY>365 && mouseY< 400) {
    //ausgeliehen = !ausgeliehen;
    String [] status = new String[KategorienAnzahl*BuecherAnzahl];
    String [] Nstatus = new String[KategorienAnzahl*BuecherAnzahl];
    int index;
    if (Kategorienzaehler==0) {
      leihlist[Kategorienzaehler][Digitalezaehler]=!leihlist[Kategorienzaehler][Digitalezaehler];
    }
     if (Kategorienzaehler==1) {
      leihlist[Kategorienzaehler][Hardwarezaehler]=!leihlist[Kategorienzaehler][Hardwarezaehler];
    }
     if (Kategorienzaehler==2) {
      leihlist[Kategorienzaehler][Materialienzaehler]=!leihlist[Kategorienzaehler][Materialienzaehler];
    }
     if (Kategorienzaehler==4) {
      leihlist[Kategorienzaehler][Zeitschriftenzaehler]=!leihlist[Kategorienzaehler][Zeitschriftenzaehler];
    }
    
    if(leihlist[Kategorienzaehler][ABuch])
    {
      Nleihlist[Kategorienzaehler][ABuch] = Namenzaehler;
    }
    else
    {
      Nleihlist[Kategorienzaehler][ABuch] = -1;
    }
    
    
  for (int i=0;i<KategorienAnzahl;i++) {
    for (int j=0;j<BuecherAnzahl;j++) {
      index = i*BuecherAnzahl + j;
      
      Nstatus[index] = str(Nleihlist[i][j]);
      if(leihlist[i][j])
      {
        status[index]="1";
      }
      else
      {
        status[index]="0";
      }
    }
  }  
  saveStrings("leihlist.txt", status);
  saveStrings("Nleihlist.txt", Nstatus);
   // println (ausgeliehen);
   // println(leihlist);
  }
  //image(imgOut,0,345,320,70);
  
     if(mouseX>283 && mouseX<308 && mouseY>13 && mouseY<38){
 hinzuMouse= !hinzuMouse;
 if(hinzuMouse)hinzu=1;
 else hinzu=0;
 }

}

void mouseReleased() {


  XReleased = mouseX;
  YReleased = mouseY;


  if (mouseY> 496 && XPressed > XReleased+10) {             
    Namenzaehler++;                       
    if (Namenzaehler > NamenAnzahl-1) {
      Namenzaehler=0;
    }
  }
  if (mouseY> 496 && XPressed < XReleased-10) {
    Namenzaehler--;                        
    if (Namenzaehler < 0) {
      Namenzaehler=NamenAnzahl-1;
    }
  }




  if (mouseY> 78 && mouseY< 150 && XPressed < XReleased+10) {             
    Kategorienzaehler--;                       
    if (Kategorienzaehler < 0) {
      Kategorienzaehler=KategorienAnzahl-1;
    }
  }
  if (mouseY> 78 && mouseY< 150 && XPressed > XReleased-10) {
    Kategorienzaehler++;                        
    if (Kategorienzaehler > KategorienAnzahl-1) {
      Kategorienzaehler=0;
    }
  } 





  if (Kategorienzaehler== 4 && mouseY> 154 && mouseY< 270 && XPressed < XReleased+10) {             
    Zeitschriftenzaehler++;                       
    if (Zeitschriftenzaehler > ZeitschriftenAnzahl-1) {
      Zeitschriftenzaehler=0;
     
    }
    ABuch=Zeitschriftenzaehler;
  }
  if (Kategorienzaehler== 4 && mouseY> 154 && mouseY< 270 && XPressed > XReleased-10) {
    Zeitschriftenzaehler--;                        
    if (Zeitschriftenzaehler < 0) {
      Zeitschriftenzaehler=ZeitschriftenAnzahl-1;
    }
   ABuch=Zeitschriftenzaehler; 
  }



  if (Kategorienzaehler== 2 && mouseY> 154 && mouseY< 270 && XPressed < XReleased+10) {             
    Materialienzaehler--;                       
       if (Materialienzaehler < 0) {
      Materialienzaehler=MaterialienAnzahl-1;
    }
    
    ABuch=Materialienzaehler;
  }
  if (Kategorienzaehler== 2 && mouseY> 154 && mouseY< 270 && XPressed > XReleased-10) {
    Materialienzaehler++;      
      if (Materialienzaehler > MaterialienAnzahl-1) {
      Materialienzaehler=0;
    }
  
    ABuch=Materialienzaehler;
  }






  if (Kategorienzaehler== 0 && mouseY> 154 && mouseY< 270 && XPressed < XReleased+10) {             
    Digitalezaehler++;                       
    if (Digitalezaehler > DigitaleAnzahl-1) {
      Digitalezaehler=0;
    }
     ABuch=Digitalezaehler;
  }
  if (Kategorienzaehler== 0 && mouseY> 154 && mouseY< 270 && XPressed > XReleased-10) {
    Digitalezaehler--;                        
    if (Digitalezaehler < 0) {
      Digitalezaehler=DigitaleAnzahl-1;
    }
     ABuch=Digitalezaehler;
  }


  if (Kategorienzaehler== 1 && mouseY> 154 && mouseY< 270 && XPressed < XReleased+10) {             
   Hardwarezaehler--;                        
    if (Hardwarezaehler < 0) {
      Hardwarezaehler=HardwareAnzahl-1;
    }
    ABuch=  Hardwarezaehler;
  }
  if (Kategorienzaehler== 1 && mouseY> 154 && mouseY< 270 && XPressed > XReleased-10) {
       Hardwarezaehler++;                       
    if (Hardwarezaehler > HardwareAnzahl-1) {
      Hardwarezaehler=0;
    }
    ABuch=  Hardwarezaehler;
  }
  
}



void keyPressed() {
  if (key==ENTER) {
    abchecken();
    //println("enter gedrückt");
  }
  else {
    scan=scan+key;
    
  }
}

void abchecken(){
  
  if(scan.equals("9782884790260")||scan.equals("828540000263")){
    println("digital color");
    Kategorienzaehler= 0;
    Digitalezaehler=1;
  }
  
  if(scan.equals("9783430111294")
  ){
    println("Designing the future");
    Kategorienzaehler= 0;
    Digitalezaehler= 2;
  }
  
   if(scan.equals("9780262182621")
  ){
    println("processing");
    Kategorienzaehler= 0;
    Digitalezaehler= 3;
  }
  
     if(scan.equals("9780262134743")
  ){
    println("interaction");
    Kategorienzaehler= 0;
    Digitalezaehler= 4;
  }
  
   if(scan.equals("7640152110092")
  ){
    println("arduino");
    Kategorienzaehler= 1;
    Hardwarezaehler= 0;
  }
  
  
  scan="";
}



