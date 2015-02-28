
//Assignment week 3
//Maria Nunez
//Activate with spacebar,'b',right click, left click

void setup(){

size(800,990);
smooth();
background(180,211,225);

//red lines
strokeWeight(5);
stroke(190,22,9);
line(0,0,900,0);

strokeWeight(20);
line(0,30,900,30);
line(0,70,900,70);
line(0,110,900,110);
line(0,150,900,150);
line(0,190,900,190);
line(0,230,900,230);
line(0,270,900,270);
line(0,310,900,310);
line(0,350,900,350);
line(0,390,900,390);
line(0,430,900,430);
line(0,470,900,470);
line(0,510,900,510);
line(0,550,900,550);
line(0,590,900,590);
line(0,630,900,630);
line(0,670,900,670);
line(0,710,900,710);
line(0,750,900,750);
line(0,790,900,790);
line(0,830,900,830);
line(0,870,900,870);
line(0,910,900,910);
line(0,950,900,950);
line(0,990,900,990);
line(0,1030,900,1030);

//circles 1st line
noStroke();
fill(180,211,225);
ellipse(25,90,170,170);
ellipse(25,290,170,170);
ellipse(25,485,170,170);
ellipse(25,685,170,170);
ellipse(25,885,170,170);
//Circles line2
ellipse(215,90,170,170);
ellipse(215,290,170,170);
ellipse(215,485,170,170);
ellipse(215,685,170,170);
ellipse(215,885,170,170);
//cIRLES 3
ellipse(405,90,170,170);
ellipse(405,290,170,170);
ellipse(405,485,170,170);
ellipse(405,685,170,170);
ellipse(405,885,170,170);
//CIRCLES4
ellipse(595,90,170,170);
ellipse(595,290,170,170);
ellipse(595,485,170,170);
ellipse(595,685,170,170);
ellipse(595,885,170,170);
//circles5
ellipse(785,90,170,170);
ellipse(785,290,170,170);
ellipse(785,485,170,170);
ellipse(785,685,170,170);
ellipse(785,885,170,170);

}

void draw(){ 
  if(mousePressed && mouseButton == LEFT){
    
    //vertical lines
stroke(102,170,205);
strokeWeight(20);

line(30,0,30,1000);
line(70,0,70,1000);
line(110,0,110,1000);
line(150,0,150,1000);
line(190,0,190,1000);
line(230,0,230,1000);
line(270,0,270,1000);
line(310,0,310,1000);
line(350,0,350,1000);
line(390,0,390,1000);
line(430,0,430,1000);
line(470,0,470,1000);
line(510,0,510,1000);
line(550,0,550,1000);
line(590,0,590,1000);
line(630,0,630,1000);
line(670,0,670,1000);
line(710,0,710,1000);
line(750,0,750,1000);
line(790,0,790,1000);
line(830,0,830,1000);


  } else if(mousePressed && (mouseButton == RIGHT)) {
  //red lines
strokeWeight(5);
stroke(190,22,9);
line(0,0,900,0);

strokeWeight(20);
line(0,30,900,30);
line(0,70,900,70);
line(0,110,900,110);
line(0,150,900,150);
line(0,190,900,190);
line(0,230,900,230);
line(0,270,900,270);
line(0,310,900,310);
line(0,350,900,350);
line(0,390,900,390);
line(0,430,900,430);
line(0,470,900,470);
line(0,510,900,510);
line(0,550,900,550);
line(0,590,900,590);
line(0,630,900,630);
line(0,670,900,670);
line(0,710,900,710);
line(0,750,900,750);
line(0,790,900,790);
line(0,830,900,830);
line(0,870,900,870);
line(0,910,900,910);
line(0,950,900,950);
line(0,990,900,990);
line(0,1030,900,1030);
  }
  
 else{
    //circles 1st line
noStroke();
fill(180,211,225);
ellipse(25,90,170,170);
ellipse(25,290,170,170);
ellipse(25,485,170,170);
ellipse(25,685,170,170);
ellipse(25,885,170,170);
//Circles line2
ellipse(215,90,170,170);
ellipse(215,290,170,170);
ellipse(215,485,170,170);
ellipse(215,685,170,170);
ellipse(215,885,170,170);
//cIRLES 3
ellipse(405,90,170,170);
ellipse(405,290,170,170);
ellipse(405,485,170,170);
ellipse(405,685,170,170);
ellipse(405,885,170,170);
//CIRCLES4
ellipse(595,90,170,170);
ellipse(595,290,170,170);
ellipse(595,485,170,170);
ellipse(595,685,170,170);
ellipse(595,885,170,170);
//circles5
ellipse(785,90,170,170);
ellipse(785,290,170,170);
ellipse(785,485,170,170);
ellipse(785,685,170,170);
ellipse(785,885,170,170);
  }
  
  if (keyPressed){
    if(key== 'b'){
      fill(190,22,9);
    rectMode(CENTER); 
    rect(25,90,100,100);
    rect(25,290,100,100);
    rect(25,480,100,100);
    rect(25,685,100,100);
    
    rect(215,90,100,100);
    rect(215,290,100,100);
    rect(215,485,100,100);
    rect(215,685,100,100);
    rect(215,885,100,100);
    
    rect(405,90,100,100);
    rect(405,290,100,100);
    rect(405,485,100,100);
    rect(405,685,100,100);
    rect(405,885,100,100);
    
    rect(595,90,100,100);
    rect(595,290,100,100);
    rect(595,485,100,100);
    rect(595,685,100,100);
    rect(595,885,100,100);
    
    rect(785,90,100,100);
    rect(785,290,100,100);
    rect(785,485,100,100);
    rect(785,685,100,100);
    rect(785,885,100,100);
    
    }
    
    else{
        //circles 1st line
noStroke();
 fill(190,22,9);
ellipse(25,90,100,100);
ellipse(25,290,100,100);
ellipse(25,485,100,100);
ellipse(25,685,100,100);
ellipse(25,885,100,100);
//Circles line2
ellipse(215,90,100,100);
ellipse(215,290,100,100);
ellipse(215,485,100,100);
ellipse(215,685,100,100);
ellipse(215,885,100,100);
//cIRLES 3
ellipse(405,90,100,100);
ellipse(405,290,100,100);
ellipse(405,485,100,100);
ellipse(405,685,100,100);
ellipse(405,885,100,100);
//CIRCLES4
ellipse(595,90,100,100);
ellipse(595,290,100,100);
ellipse(595,485,100,100);
ellipse(595,685,100,100);
ellipse(595,885,100,100);
//circles5
ellipse(785,90,100,100);
ellipse(785,290,100,100);
ellipse(785,485,100,100);
ellipse(785,685,100,100);
ellipse(785,885,100,100);
    }
  }
  
  
  }





