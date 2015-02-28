

import guicomponents.*;
color headColor; //variabel för gubbens färg
color bColor; //variabel för bakgrundsfärg
PImage eld; 
PImage is;
boolean redButton;
boolean greenButton;
boolean blueButton;
int headSize; //variabel för huvudets strlk
GTextField textField; //variabel för textfält

//variabler för knappar
GButton okButton; 
GButton varmButton;
GButton beigeButton;
GButton kallButton;
void setup(){
     
  size(320, 480); //ställ in skärmens storlek
  
  headColor = color(250, 225, 200); //från början är ansiktet beige
  bColor = color(250); //bakgrundsfärgen är vit
  eld = loadImage("eld.png"); //ladda bild, eld
  is = loadImage("is.png"); //ladda bild, is
     headSize = 200; //huvudets storlek
     textField = new GTextField(this, "200",35,350,50,20); //textrutan
     okButton = new GButton (this,"Ok",95,350,30,20);//okknapp
   
    //knapparna v
      varmButton = new GButton(this, "Varmt", 30, 400, 80, 40);
      beigeButton = new GButton(this, "Ljummet", 110, 400, 80, 40);
      kallButton = new GButton(this, "Kallt", 190, 400, 80, 40);
     
      //Knapparnas färger v
   varmButton.setColours(color(255, 65, 0), color(255, 10, 0), color(180,20,0));
   beigeButton.setColours(color(170, 200, 0), color(200, 250, 80), color(100,150,80));
   kallButton.setColours(color(0, 200, 250), color(0, 100, 255), color(20,20,250));
}
void draw(){
  
      background(bColor); //sätt bakgrundsfärg
      fill(headColor); 
      ellipse(170,170,headSize,headSize); //huvud
      fill(255); //ögonens fyllnadsfärg
      ellipse (120,160, 20,20); //h.öga
      ellipse (220,160, 20,20); //v.öga
      fill (0);
      ellipse (120,160, 10,10); //pupill
      ellipse(220,160,10,10); //pupill
      
      text("Ändra huvudets storlek!" ,35,340);
      text("Bestäm temperaturen!" ,35,390);
      
      
      
      
    if(greenButton) {//om den gröna knappen är tryckt
       line(150,220,205,220); //mun
       
       bColor = color (200,250,180); //Bgrundsfärg
       headColor = color(250, 225, 200);
       
            
    }
    if(redButton){     //om den röda knappen är tryckt
      ellipse(175,220,100,60); //gap
      image(eld, 0,40); //ELD
      bColor = color(255, 170, 0);//bakgrundsfärg
      headColor = color(255, 0, 0); //ändra ansiktet till röd
      text("Ändra huvudets storlek!" ,35,340); //texten försvann bakom bildfilen
      text("Bestäm temperaturen!" ,35,390);
    }
    if(blueButton) {  //om den blå knappen är tryckt
      bColor = color (150,200,255); //bakgrundsfärg
      ellipse (175,220,20,20); //mun
      image (is, 0,0); //istappar
      headColor = color(110, 110, 255); //ändra ansikte till blå}
}
    
  
        
}
void handleButtonEvents(GButton button){ //när man klickar på en knapp
      if(button == beigeButton){ //om det var den gröna knappen
      greenButton = true;
      redButton = false;
      blueButton = false;

           
      }else if(button == varmButton){ //om det var den röda knappen
      redButton = true;
      greenButton = false;
      blueButton = false;
     
      }else if(button == kallButton){ //om det var den blå knappen
      blueButton = true;
      redButton = false;
      greenButton = false;
   
            
      }
      else if (button == okButton){
        headSize = Integer.parseInt( textField.getText() );
      }
}

