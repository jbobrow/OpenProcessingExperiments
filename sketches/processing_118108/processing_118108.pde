
import ddf.minim.*;


Button[] buttons = new Button[7];

Table data; 
int rowIdx = 0; 
int colIdx = 0;
int counter;
int counterReset = 20;
float noteduration=0.75;
int noteDuration=1;
Minim minim;
AudioOutput out;

// pent scale assigned from buttons 0-6 (7 total)

int C_Major =0; 
int D_Major =1;
int E_Major =2;
int F_Major =3;
int G_Major =4;
int A_Major =5;
int B_Major =6;

//String Notes which have the mapped variable
String CMajorPentscaleNote;
String DMajorPentscaleNote;
String EMajorPentscaleNote;
String FMajorPentscaleNote;
String GMajorPentscaleNote;
String AMajorPentscaleNote;
String BMajorPentscaleNote;

void setup() {

  minim = new Minim(this);
  out = minim.getLineOut (Minim.STEREO);
  data = loadTable ("pi.csv", "csv");
  size(600, 200);
  smooth();
  for (int i = 0; i < buttons.length; i++) {
    buttons[i] = new Button(i*75+45, height/2-25, 50, 50);
  }
}
void draw() {

  background(175);
  ifmapping();
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].display();
    playnote();
    fill (205, 100, 100);
    text("Speed of PI change is -" + counterReset +"-    (Hold the -U- key to increase by 1, hold the -I- key to decrease by 1)", 25, 195);
    text("Note duration is currently -" + noteduration +"- seconds. (Hold the -J- key to increase by 1, hold the -K- key to decrease by 1)", 2, 180);
  }
  fill(255);
  text(" C \nMajor", 50, 100);
  text(" D \nMajor", 125, 100);
  text(" E \nMajor", 200, 100);
  text(" F \nMajor", 275, 100);
  text(" G \nMajor", 350, 100);
  text(" A \nMajor", 425, 100);
  text(" B \nMajor", 500, 100);

  fill (0);
  text("CMajorPentscaleNote \nis currently: " + CMajorPentscaleNote, 30, 50);
  fill (255, 50, 25);
  text("DMajorPentscaleNote \nis currently: " + DMajorPentscaleNote, 160, 50);
  fill (50, 150, 50);
  text("EMajorPentscaleNote \nis currently: " + EMajorPentscaleNote, 290, 50);
  fill(0, 0, 255);  
  text("FMajorPentscaleNote \nis currently: " + FMajorPentscaleNote, 420, 50);
  fill(0, 100, 25);  
  text("GMajorPentscaleNote \nis currently: " + GMajorPentscaleNote, 110, 150);
  fill(200, 100, 55);  
  text("AMajorPentscaleNote \nis currently: " + AMajorPentscaleNote, 240, 150);
  fill(100, 100, 55);  
  text("BMajorPentscaleNote \nis currently: " + BMajorPentscaleNote, 370, 150);

  counter++;
  if ( counter == counterReset ) { 
    counter =0;
    colIdx++;
    if (colIdx == 10) {
      colIdx = 0;

      rowIdx++;
      if (rowIdx == data.getRowCount()) rowIdx = 0;
    }
    if (keyPressed) {
      if (key == 'j') {
        noteduration+=1;
        noteDuration+=1;
      }

      if (key == 'k') {
        noteduration-=1;
        noteDuration-=1;
      }

      if (key == 'u') {

        counterReset+=1;
      }

      if (key == 'i') {

        counterReset-=1;
      }
    }
  }
}

void mousePressed() {
  for (int i = 0; i < buttons.length; i++) {
    if ( buttons[i].click(mouseX, mouseY) == true ) {
      // we know that button 'i' has been clicked
    }
  }
}

  class Button  {   
 
  float x;  
  float y;  
  float w;  
  float h;  
  boolean on;
  
  int gray;
  int timer;
  
  Button(float tempX, float tempY, float tempW, float tempH )  {   
    x  = tempX;  
    y  = tempY;  
    w  = tempW;  
    h  = tempH;  
    on = false; 
  }   
 
  boolean click(int mx, int my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      on = !on;
      gray = 175;
      timer = 1 + noteDuration * 60; // 6 sec at 60 fps 
      return true;
    }
    return false;
  }
 
  void display() {
    // The color changes based on the state of the button
    fill(gray);
    if (timer > 0) {
      timer--;  // fade
      if (timer == 0) gray = 0;
    }
     
    rect(x,y,w,h);
  }
   
}  // end class
// note integers

String c3=  "C3";
String cS3= "C#3";
String c4=  "C4";
String cS4= "C#4";
String c5= "C5";
String cS5= "C#5";
String d3=  "D3";
String d4=  "D4";
String dS4=  "D#4";
String d5=  "D5";
String dS5=  "D#5";
String e3=  "E3";
String e4=  "E4";
String e5=  "E5";
String f3=  "F3";
String fS3=  "F#3";
String f4=  "F4";
String fS4=  "F#4";
String fS5=  "F#5";
String g3=  "G3";
String gS3=  "G#3";
String g4=  "G4";
String gS4=  "G#4";
String gS5=  "G#5";
String a3=  "A3";
String a4=  "A4";
String b3=  "B3";
String b4=  "B4";
void ifmapping() {
  
   TableRow row = data.getRow(rowIdx);
  int digit = row.getInt(colIdx);  // idx --> index 
  float Note =digit;
  
text("Current placement digit of PI is " + digit,410,25);

  if (Note == 0) {
  CMajorPentscaleNote = c3;
  DMajorPentscaleNote = d3;
  EMajorPentscaleNote = e3;
  FMajorPentscaleNote =f3;
  GMajorPentscaleNote= g3;
  AMajorPentscaleNote= a3;
  BMajorPentscaleNote= b3;

}
else if (Note ==1) {
  CMajorPentscaleNote = d3;
  DMajorPentscaleNote = e3;
  EMajorPentscaleNote = fS3;
  FMajorPentscaleNote = g3;
  GMajorPentscaleNote = a3;
  AMajorPentscaleNote= b3;
  BMajorPentscaleNote= cS4;

}
else if (Note ==2) {
  CMajorPentscaleNote = e3;
  DMajorPentscaleNote = fS3;
  EMajorPentscaleNote = gS3;
  FMajorPentscaleNote = a3;
  GMajorPentscaleNote =b3;
  AMajorPentscaleNote= cS4;
  BMajorPentscaleNote= dS4;

}
else if (Note ==3) {
  CMajorPentscaleNote = g3;
  DMajorPentscaleNote = a3;
  EMajorPentscaleNote = b3;
  FMajorPentscaleNote = c4;
  GMajorPentscaleNote =d4;
  AMajorPentscaleNote= e4;
  BMajorPentscaleNote= fS4;

}
else if (Note ==4) {
    CMajorPentscaleNote = a3;
    DMajorPentscaleNote = b3;
    EMajorPentscaleNote = cS4;
    FMajorPentscaleNote = d4;
    GMajorPentscaleNote =e4;
    AMajorPentscaleNote= fS4;
    BMajorPentscaleNote= gS4;

}
else if (Note ==5) {
  CMajorPentscaleNote = c4;
  DMajorPentscaleNote = d4;
  EMajorPentscaleNote = e4;
  FMajorPentscaleNote = f4;
  GMajorPentscaleNote =g4;
  AMajorPentscaleNote= a4 ;
  BMajorPentscaleNote= b4;

}
else if (Note ==6) {
  CMajorPentscaleNote = d4;
  DMajorPentscaleNote = e4;
  EMajorPentscaleNote = fS4;
  FMajorPentscaleNote = g4;
  GMajorPentscaleNote =a4;
  AMajorPentscaleNote= b4 ;
  BMajorPentscaleNote= cS5;


}
else if (Note ==7) {
  CMajorPentscaleNote = e4;
  DMajorPentscaleNote = fS4;
  EMajorPentscaleNote =gS4;
  FMajorPentscaleNote = a4;
  GMajorPentscaleNote =b4;
  AMajorPentscaleNote= cS5 ;
  BMajorPentscaleNote= dS5;


}
else if (Note ==8) {
  CMajorPentscaleNote = g4;
  DMajorPentscaleNote = a4;
  EMajorPentscaleNote=b4;
  FMajorPentscaleNote =c5;
  GMajorPentscaleNote =d5;
  AMajorPentscaleNote= e5 ;
  BMajorPentscaleNote= fS5;


}
else if (Note ==9) {
  CMajorPentscaleNote = a4;
  DMajorPentscaleNote = b4;
  EMajorPentscaleNote=cS5;
  FMajorPentscaleNote = d5;
  GMajorPentscaleNote =e5;
  AMajorPentscaleNote= fS5 ;
  BMajorPentscaleNote= gS5;


}

}

void playnote() {

  if (buttons[C_Major].on) {
    out.playNote( 0, noteduration, CMajorPentscaleNote );
    buttons[C_Major].on = false;
  } 

  if (buttons[D_Major].on) {
    out.playNote( 0, noteduration, DMajorPentscaleNote );
    buttons[D_Major].on = false;
  }
  if (buttons[E_Major].on) {
    out.playNote( 0, noteduration, EMajorPentscaleNote );
    buttons[E_Major].on = false;
  }
  if (buttons[F_Major].on) {
       out.playNote( 0, noteduration, FMajorPentscaleNote );
    buttons[F_Major].on = false;
  }
  if (buttons[G_Major].on) {
           out.playNote( 0, noteduration, GMajorPentscaleNote );
    buttons[G_Major].on = false;

  }
  if (buttons[A_Major].on) {
               out.playNote( 0,noteduration, AMajorPentscaleNote );

    buttons[A_Major].on = false;
  }
  if (buttons[B_Major].on) {
                 out.playNote( 0, noteduration, BMajorPentscaleNote );

    buttons[B_Major].on = false;
  }
  
  
  
}



