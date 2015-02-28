
// Making my own Paint !!!
// You can choose a color, a thickness and draw what you want !
// Or choose a color and a shape and draw it just by clicking !

/* @pjs preload="COULEURS.png,EPAISSEURS.png,SHAPES.png,SHAPESS.png,SHAPESSS.png,GOMME.png"; */

// Global variables 
  //Images 
  PImage COLORS;
  PImage THICKNESS;
  PImage SHAPES; 
  PImage SHAPESS;
  PImage SHAPESSS;
  PImage GOMME;
    
  //Colors 
  int black1;
  int grey2;
  int red3;
  int red4;
  int orange5;
  int white6;
  int grey7;
  int brown8;
  int pink9;
  int yellow10;
  int yellow11;
  int green12;
  int blue13;
  int blue14;
  int purple15;
  int yellow16;
  int green17;
  int blue18;
  int blue19;
  int purple20;
  
  //Thicknesses 
  int thick1;
  int thick2;
  int thick3;
  int thick4;
  int thick5; 
  int thick10;
  int thick15;
  
  //Variables
  color ink = color (0,0,0);
  float shape = 0;
  float thickness = 0;
  float rubber = 0;
  
//setup() 
void setup() {
  //General 
  background(255);
  size(1280,720);
  
  //Colors 
  black1 = color(0);
  grey2 = color(127);
  red3 = color(136,0,21);
  red4 = color(237,28,36);
  orange5 = color(255,127,39);
  white6 = color(255);
  grey7 = color(195);
  brown8 = color(185,122,87);
  pink9 = color(255,174,201);
  yellow10 = color(255,201,14);
  yellow11 = color(255,242,0);
  green12 = color(34,177,76);
  blue13 = color(0,162,232);
  blue14 = color(63,72,204);
  purple15 = color(163,73,164);
  yellow16 = color(239,228,176);
  green17 = color(181,230,29);
  blue18 = color(153,217,234);
  blue19 = color(112,146,190);
  purple20 = color(200,191,231);
  
  //Thicknesses
  thick1 = 1;
  thick2 = 2;
  thick3 = 3;
  thick4 = 4;
  thick5 = 5;
  thick10 = 10;
  thick15 = 15;
  
  //Images
  COLORS = loadImage("COULEURS.png");
  THICKNESS = loadImage("EPAISSEURS.png");
  SHAPES = loadImage("SHAPES.png");
  SHAPESS = loadImage("SHAPESS.png");
  SHAPESSS = loadImage("SHAPESSS.png");
  GOMME = loadImage("GOMME.png");
}

//draw()
void draw() {
  //Icons
  fill(235);
  stroke(135);
  strokeWeight(2);
  rect(-2,-2,125,720);  
  image(COLORS, 7, 37);
  image(THICKNESS, 7, 150);
  image(SHAPES, 7, 263);
  image(SHAPESS, 7, 386);
  image(SHAPESSS, 7, 510);
  image(GOMME, 7, 615);
}

void mousePressed() {
//Color Choice
  //Case 1 : Black1
  if (mouseX<29 && mouseX>7 && mouseY<58 && mouseY>37) {
    COLORS = loadImage("COULEURS1.png");
    GOMME = loadImage("GOMME.png");
  }
  //Case 2 : Grey2
  if (mouseX<51 && mouseX>30 && mouseY<58 && mouseY>37) {
    COLORS = loadImage("COULEURS2.png");
    GOMME = loadImage("GOMME.png");
  }
  //Case 3 : Red3
  if (mouseX<73 && mouseX>52 && mouseY<58 && mouseY>37) {
    COLORS = loadImage("COULEURS3.png");
    GOMME = loadImage("GOMME.png");
  }
  //Case 4 : Red4
  if (mouseX<95 && mouseX>74 && mouseY<58 && mouseY>37) {
    COLORS = loadImage("COULEURS4.png");
    GOMME = loadImage("GOMME.png");
  }
  //Case 5 : Orange5 
  if (mouseX<117 && mouseX>96 && mouseY<58 && mouseY>37) {
    COLORS = loadImage("COULEURS5.png");
    GOMME = loadImage("GOMME.png");
  }
  //Case 6 : White6
  if (mouseX<29 && mouseX>7 && mouseY<80 && mouseY>59) {
    COLORS = loadImage("COULEURS6.png");
    GOMME = loadImage("GOMME.png");
  }
  //Case 7 : Grey7 
  if (mouseX<51 && mouseX>30 && mouseY<80 && mouseY>59) {
    COLORS = loadImage("COULEURS7.png");
    GOMME = loadImage("GOMME.png");
  }  
  //Case 8 : Brown8
  if (mouseX<73 && mouseX>52 && mouseY<80 && mouseY>59) {
    COLORS = loadImage("COULEURS8.png");
    GOMME = loadImage("GOMME.png");
  }  
  //Case 9 : Pink9
  if (mouseX<95 && mouseX>74 && mouseY<80 && mouseY>59) {
    COLORS = loadImage("COULEURS9.png");
    GOMME = loadImage("GOMME.png");
  }  
  //Case 10 : Yellow10
  if (mouseX<117 && mouseX>96 && mouseY<80 && mouseY>59) {
    COLORS = loadImage("COULEURS10.png");
    GOMME = loadImage("GOMME.png");
  }
  //Case 11 : Yellow11
  if (mouseX<29 && mouseX>7 && mouseY<102 && mouseY>81) {
    COLORS = loadImage("COULEURS11.png");
    GOMME = loadImage("GOMME.png");
  }
  //Case 12 : Green12
  if (mouseX<51 && mouseX>30 && mouseY<102 && mouseY>81) {
    COLORS = loadImage("COULEURS12.png");
    GOMME = loadImage("GOMME.png");
  }
  //Case 13 : Blue13
  if (mouseX<73 && mouseX>52 && mouseY<102 && mouseY>81) {
    COLORS = loadImage("COULEURS13.png");
    GOMME = loadImage("GOMME.png");
  }
  //Case 14 : Blue14
  if (mouseX<95 && mouseX>74 && mouseY<102 && mouseY>81) {
    COLORS = loadImage("COULEURS14.png");
    GOMME = loadImage("GOMME.png");
  }
  //Case 15 : Purple15
  if (mouseX<117 && mouseX>96 && mouseY<102 && mouseY>81) {
    COLORS = loadImage("COULEURS15.png");
    GOMME = loadImage("GOMME.png");
  }
  //Case 16: Yellow 16
  if (mouseX<29 && mouseX>7 && mouseY<124 && mouseY>103) {
    COLORS = loadImage("COULEURS16.png");
    GOMME = loadImage("GOMME.png");
  }
  //Case 17: Green17
  if (mouseX<51 && mouseX>30 && mouseY<124 && mouseY>103) {
    COLORS = loadImage("COULEURS17.png");
    GOMME = loadImage("GOMME.png");
  }
  //Case 18 : Blue18
  if (mouseX<73 && mouseX>52 && mouseY<124 && mouseY>103) {
    COLORS = loadImage("COULEURS18.png");
    GOMME = loadImage("GOMME.png");
  }
  //Case 19 : Blue19
  if (mouseX<95 && mouseX>74 && mouseY<124 && mouseY>103) {
    COLORS = loadImage("COULEURS19.png");
    GOMME = loadImage("GOMME.png");
  }
  //Case 20 : Purple20
  if (mouseX<117 && mouseX>96 && mouseY<124 && mouseY>103) {
    COLORS = loadImage("COULEURS20.png");
    GOMME = loadImage("GOMME.png");
  }
  
//Thickness Choice
  //Case 1 : 1px
  if (mouseX<115 && mouseX>7 && mouseY<160 && mouseY>150) {
    THICKNESS = loadImage("EPAISSEURS1.png");
    GOMME = loadImage("GOMME.png");
    thickness = thick1;
  }
  //Case 2 : 2px
  if (mouseX<115 && mouseX>7 && mouseY<168 && mouseY>161) {
    THICKNESS = loadImage("EPAISSEURS2.png");
    GOMME = loadImage("GOMME.png");
    thickness = thick2;
  }
  //Case 3 : 3px
  if (mouseX<115 && mouseX>7 && mouseY<177 && mouseY>169) {
    THICKNESS = loadImage("EPAISSEURS3.png");
    GOMME = loadImage("GOMME.png");
    thickness = thick3;
  }
  //Case 4 : 4px
  if (mouseX<115 && mouseX>7 && mouseY<187 && mouseY>178) {
    THICKNESS = loadImage("EPAISSEURS4.png");
    GOMME = loadImage("GOMME.png");
    thickness = thick4;
  }
  //Case 5 : 5px
  if (mouseX<115 && mouseX>7 && mouseY<198 && mouseY>188) {
    THICKNESS = loadImage("EPAISSEURS5.png");
    GOMME = loadImage("GOMME.png");
    thickness = thick5;
  }
  //Case 6 : 10px
  if (mouseX<115 && mouseX>7 && mouseY<214 && mouseY>199) {
      THICKNESS = loadImage("EPAISSEURS10.png");
      GOMME = loadImage("GOMME.png");
      thickness = thick10;
  }
  //Case 7 : 15px
  if (mouseX<115 && mouseX>7 && mouseY<238 && mouseY>215) {
    THICKNESS = loadImage("EPAISSEURS15.png");
    GOMME = loadImage("GOMME.png");
    thickness = thick15;
  }

//Choosing a shape
  //Case 1 : Full ellipse
  if (mouseX<44 && mouseX>7 && mouseY<307 && mouseY>263) {
    SHAPES = loadImage("SHAPES1.png");
    SHAPESS = loadImage("SHAPESS.png");
    SHAPESSS = loadImage("SHAPESSS.png");
    THICKNESS = loadImage("EPAISSEURS.png");
    GOMME = loadImage("GOMME.png");
    shape = 1;
  }
  //Case 2 : Full square
  if (mouseX<80 && mouseX>44 && mouseY<307 && mouseY>263) {
    SHAPES = loadImage("SHAPES2.png");
    SHAPESS = loadImage("SHAPESS.png");
    SHAPESSS = loadImage("SHAPESSS.png");
    THICKNESS = loadImage("EPAISSEURS.png");
    GOMME = loadImage("GOMME.png");
    shape = 2;
  }
  //Case 3 : Full triangle
  if (mouseX<117 && mouseX>80 && mouseY<307 && mouseY>263) {
    SHAPES = loadImage("SHAPES3.png");
    SHAPESS = loadImage("SHAPESS.png");
    SHAPESSS = loadImage("SHAPESSS.png");
    THICKNESS = loadImage("EPAISSEURS.png");
    GOMME = loadImage("GOMME.png");
    shape = 3;
  }
  //Case 4 : ellipse
  if (mouseX<44 && mouseX>7 && mouseY<351 && mouseY>307) {
    SHAPES = loadImage("SHAPES4.png");
    SHAPESS = loadImage("SHAPESS.png");
    SHAPESSS = loadImage("SHAPESSS.png");
    GOMME = loadImage("GOMME.png");
    shape = 4;
  }
  //Case 5 : square
  if (mouseX<80 && mouseX>44 && mouseY<351 && mouseY>307) {
    SHAPES = loadImage("SHAPES5.png");
    SHAPESS = loadImage("SHAPESS.png");
    SHAPESSS = loadImage("SHAPESSS.png");
    GOMME = loadImage("GOMME.png");
    shape = 5;
  }
  //Case 6 : triangle
  if (mouseX<117 && mouseX>80 && mouseY<351 && mouseY>307) {
    SHAPES = loadImage("SHAPES6.png");
    SHAPESS = loadImage("SHAPESS.png");
    SHAPESSS = loadImage("SHAPESSS.png");
    GOMME = loadImage("GOMME.png");
    shape = 6;
  }
  //Case 7 : Full star
  if (mouseX<47 && mouseX>7 && mouseY<424 && mouseY>386) {
    SHAPES = loadImage("SHAPES.png");
    SHAPESS = loadImage("SHAPESS1.png");
    SHAPESSS = loadImage("SHAPESSS.png");    
    THICKNESS = loadImage("EPAISSEURS.png");
    GOMME = loadImage("GOMME.png");
    shape = 7;
  }
  //Case 8 : Full rectangle
  if (mouseX<117 && mouseX>47 && mouseY<424 && mouseY>386) {
    SHAPES = loadImage("SHAPES.png");
    SHAPESS = loadImage("SHAPESS2.png");
    SHAPESSS = loadImage("SHAPESSS.png");
    THICKNESS = loadImage("EPAISSEURS.png");
    GOMME = loadImage("GOMME.png");
    shape = 8;
  }
  //Case 9 : star
  if (mouseX<47 && mouseX>7 && mouseY<477 && mouseY>446) {
    SHAPES = loadImage("SHAPES.png");
    SHAPESS = loadImage("SHAPESS3.png");
    SHAPESSS = loadImage("SHAPESSS.png");
    GOMME = loadImage("GOMME.png");
    shape = 9;
  }
  //Case 10 : rectangle
  if (mouseX<117 && mouseX>47 && mouseY<477 && mouseY>446) {
    SHAPES = loadImage("SHAPES.png");
    SHAPESS = loadImage("SHAPESS4.png");
    SHAPESSS = loadImage("SHAPESSS.png");
    GOMME = loadImage("GOMME.png");
    shape = 10;
  }
  //Case 11 : full pentagon
  if (mouseX<47 && mouseX>7 && mouseY<548 && mouseY>510) {
    SHAPES = loadImage("SHAPES.png");
    SHAPESS = loadImage("SHAPESS.png");
    SHAPESSS = loadImage("SHAPESSS1.png");    
    THICKNESS = loadImage("EPAISSEURS.png");
    GOMME = loadImage("GOMME.png");
    shape = 11;
  }
  //Case 12 : full Hexagon 
  if (mouseX<84 && mouseX>47 && mouseY<548 && mouseY>510) {
    SHAPES = loadImage("SHAPES.png");
    SHAPESS = loadImage("SHAPESS.png");
    SHAPESSS = loadImage("SHAPESSS2.png");
    THICKNESS = loadImage("EPAISSEURS.png");
    GOMME = loadImage("GOMME.png");
    shape = 12;
  }
  //Case 13 : full arrow to right
  if (mouseX<117 && mouseX>84 && mouseY<528 && mouseY>510) {
    SHAPES = loadImage("SHAPES.png");
    SHAPESS = loadImage("SHAPESS.png");
    SHAPESSS = loadImage("SHAPESSS3.png");
    THICKNESS = loadImage("EPAISSEURS.png");
    GOMME = loadImage("GOMME.png");
    shape = 13;
  }
  //Case 14 : full arrow to left
  if (mouseX<117 && mouseX>84 && mouseY<548 && mouseY>528) {
    SHAPES = loadImage("SHAPES.png");
    SHAPESS = loadImage("SHAPESS.png");
    SHAPESSS = loadImage("SHAPESSS4.png");    
    THICKNESS = loadImage("EPAISSEURS.png");
    GOMME = loadImage("GOMME.png");
    shape = 14;
  }
  //Case 15 : empty pentagon
  if (mouseX<47 && mouseX>7 && mouseY<599 && mouseY>561) {
    SHAPES = loadImage("SHAPES.png");
    SHAPESS = loadImage("SHAPESS.png");
    SHAPESSS = loadImage("SHAPESSS5.png");
    GOMME = loadImage("GOMME.png");
    shape = 15;
  }
  //Case 16 : empty hexagon
  if (mouseX<84 && mouseX>47 && mouseY<599 && mouseY>561) {
    SHAPES = loadImage("SHAPES.png");
    SHAPESS = loadImage("SHAPESS.png");
    SHAPESSS = loadImage("SHAPESSS6.png");
    GOMME = loadImage("GOMME.png");
    shape = 16;
  }
  //Case 17 : empty arrow to right
  if (mouseX<117 && mouseX>84 && mouseY<578 && mouseY>561) {
    SHAPES = loadImage("SHAPES.png");
    SHAPESS = loadImage("SHAPESS.png");
    SHAPESSS = loadImage("SHAPESSS7.png");
    GOMME = loadImage("GOMME.png");
    shape = 17;
  }
  //Case 18 : empty arrow to left
  if (mouseX<117 && mouseX>84 && mouseY<599 && mouseY>578) {
    SHAPES = loadImage("SHAPES.png");
    SHAPESS = loadImage("SHAPESS.png");
    SHAPESSS = loadImage("SHAPESSS8.png");
    GOMME = loadImage("GOMME.png");
    shape = 18;
  }
//Rubber
  if (mouseX<128 && mouseX>20 && mouseY<701 && mouseY>615) {
    GOMME = loadImage("GOMME2.png");
    SHAPES = loadImage("SHAPES.png");
    SHAPESS = loadImage("SHAPESS.png");
    SHAPESSS = loadImage("SHAPESSS.png");
    THICKNESS = loadImage("EPAISSEURS.png");
    COLORS = loadImage("COULEURS.png");
    rubber = 1;
    thickness = 0;
  }
} 

//Mouse dragged
void mouseDragged(){
  //Pencil 
  if (thickness != 0 && mouseX > 125) {
    strokeWeight(thickness);
    stroke(ink);
    line(mouseX, mouseY,pmouseX,pmouseY);
  }
  if (rubber != 0 && mouseX > 125) {
    noStroke();
    fill(white6);
    ellipse(mouseX, mouseY,50,50); 
  }
}

//Mouse clicked
void mouseClicked(){
  //Selection of COLOR
      //Case 1 : Black1
      if (mouseX<29 && mouseX>7 && mouseY<58 && mouseY>37) {
        ink = black1;
      }
      //Case 2 : Grey2
      if (mouseX<51 && mouseX>30 && mouseY<58 && mouseY>37) {
        ink = grey2;
      }
      //Case 3 : Red3
      if (mouseX<73 && mouseX>52 && mouseY<58 && mouseY>37) {
        ink = red3;
      }
      //Case 4 : Red4
      if (mouseX<95 && mouseX>74 && mouseY<58 && mouseY>37) {
        ink = red4;
      }
      //Case 5 : Orange5
      if (mouseX<117 && mouseX>96 && mouseY<58 && mouseY>37) {
        ink = orange5;
      }
      //Case 6 : White6
      if (mouseX<29 && mouseX>7 && mouseY<80 && mouseY>59) {
        ink = white6;
      }
      //Case 7 : Grey7
      if (mouseX<51 && mouseX>30 && mouseY<80 && mouseY>59) {
        ink = grey7;
      }  
      //Case 8 : Brown8
      if (mouseX<73 && mouseX>52 && mouseY<80 && mouseY>59) {
        ink = brown8;
      }  
      //Case 9 : Pink9
      if (mouseX<95 && mouseX>74 && mouseY<80 && mouseY>59) {
        ink = pink9;
      }  
      //Case 10 : Yellow10
      if (mouseX<117 && mouseX>96 && mouseY<80 && mouseY>59) {
        ink = yellow10;
      }
      //Case 11 : Yellow11
      if (mouseX<29 && mouseX>7 && mouseY<102 && mouseY>81) {
        ink = yellow11;
      }
      //Case 12 : Green12
      if (mouseX<51 && mouseX>30 && mouseY<102 && mouseY>81) {
        ink = green12;
      }
      //Case 13 : Blue13
      if (mouseX<73 && mouseX>52 && mouseY<102 && mouseY>81) {
        ink = blue13;
      }
      //Case 14 : Blue14
      if (mouseX<95 && mouseX>74 && mouseY<102 && mouseY>81) {
        ink = blue14;
      }
      //Case 15 : Purple15
      if (mouseX<117 && mouseX>96 && mouseY<102 && mouseY>81) {
        ink = purple15;
      }
      //Case 16: Yellow 16
      if (mouseX<29 && mouseX>7 && mouseY<124 && mouseY>103) {
        ink = yellow16;
      }
      //Case 17: Green17
      if (mouseX<51 && mouseX>30 && mouseY<124 && mouseY>103) {
        ink = green17;
      }
      //Case 18 : Blue18
      if (mouseX<73 && mouseX>52 && mouseY<124 && mouseY>103) {
        ink = blue18;
      }
      //Case 19 : Blue19
      if (mouseX<95 && mouseX>74 && mouseY<124 && mouseY>103) {
        ink = blue19;
      }
      //Case 20 : Purple20
      if (mouseX<117 && mouseX>96 && mouseY<124 && mouseY>103) {
        ink = purple20;
      }
      
  //Selection of a thickness 
    //Case 1 : 1px 
    if (mouseX<115 && mouseX>7 && mouseY<157 && mouseY>155) {
      thickness = thick1;
      rubber = 0;
    }
    //Case 2 : 2px 
    if (mouseX<115 && mouseX>7 && mouseY<163 && mouseY>161) {
      thickness = thick2;
      rubber = 0;
    }
    //Case 3 : 3px 
    if (mouseX<115 && mouseX>7 && mouseY<173 && mouseY>171) {
      thickness = thick3;
      rubber = 0;
    }
    //Case 4 : 4px 
    if (mouseX<115 && mouseX>7 && mouseY<184 && mouseY>180) {
      thickness = thick4;
      rubber = 0;
    }
    //Case 5 : 5px 
    if (mouseX<115 && mouseX>7 && mouseY<195 && mouseY>190) {
      thickness = thick5;
      rubber = 0;
    }
    //Case 6 : 10px 
    if (mouseX<115 && mouseX>7 && mouseY<211 && mouseY>201) {
      thickness = thick10;
      rubber = 0;
    }
    //Case 7 : 15px 
    if (mouseX<115 && mouseX>7 && mouseY<232 && mouseY>217) {
      thickness = thick15;
      rubber = 0;
    }
  //Rubber
  if (mouseX<128 && mouseX>20 && mouseY<701 && mouseY>615) {
    rubber = 1;
    thickness = 0;
  }
  //Shapes 
    //Drawing a full circle
    if (shape == 1 && mouseX > 125) {
      noStroke();
      fill(ink);
      ellipse(mouseX, mouseY, 100,100);
    }
    //Drawing a full square
    if (shape == 2 && mouseX > 125) {
      noStroke();
      fill(ink);
      rect(mouseX, mouseY, 100,100);
    }
    //Drawing a full triangle
    if (shape == 3 && mouseX > 125) {
      noStroke();
      fill(ink);
      triangle(mouseX, mouseY, mouseX+40, mouseY-80, mouseX+80, mouseY);
    }
    //Drawing an empty circle
    if (shape == 4 && mouseX > 125) {
      stroke(ink);
      noFill();
      strokeWeight(thickness);
      ellipse(mouseX,mouseY,100,100);
    }
    //Drawing an empty square
    if (shape == 5 && mouseX > 125) {
      stroke(ink);
      noFill();
      strokeWeight(thickness);
      rect(mouseX,mouseY,100,100);
    }
    //Drawing an empty triangle
    if (shape == 6 && mouseX > 125) {
      stroke(ink);
      noFill();
      strokeWeight(thickness);
      triangle(mouseX, mouseY, mouseX+40, mouseY-80, mouseX+80, mouseY);
    }
    //Drawing a star
    if (shape == 7 && mouseX > 125) {
      noStroke();
      fill(ink);
      beginShape();
      vertex(mouseX, mouseY);
      vertex(mouseX+14, mouseY+30);
      vertex(mouseX+47, mouseY+35);
      vertex(mouseX+23, mouseY+57);
      vertex(mouseX+29, mouseY+90);
      vertex(mouseX+0, mouseY+75);
      vertex(mouseX-29, mouseY+90);
      vertex(mouseX-23, mouseY+57);
      vertex(mouseX-47,mouseY+35);
      vertex(mouseX-14, mouseY+30);
      endShape(CLOSE);
    }
    //Drawing an empty star
    if (shape == 9 && mouseX > 125) {
      stroke(ink);
      noFill();
      strokeWeight(thickness);
      beginShape();
      vertex(mouseX, mouseY);
      vertex(mouseX+14, mouseY+30);
      vertex(mouseX+47, mouseY+35);
      vertex(mouseX+23, mouseY+57);
      vertex(mouseX+29, mouseY+90);
      vertex(mouseX+0, mouseY+75);
      vertex(mouseX-29, mouseY+90);
      vertex(mouseX-23, mouseY+57);
      vertex(mouseX-47,mouseY+35);
      vertex(mouseX-14, mouseY+30);
      endShape(CLOSE);
    }
    //Drawing a full rectangle
    if (shape == 8 && mouseX > 125) {
      noStroke();
      fill(ink);
      rect(mouseX, mouseY, 200,100);
    }
    //Drawing an empty rectangle
    if (shape == 10 && mouseX > 125) {
      stroke(ink);
      strokeWeight(thickness);
      noFill();
      rect(mouseX, mouseY, 200,100);
    }
    //Drawing a full pentagon
    if (shape == 11 && mouseX>125) {
      noStroke();
      fill(ink);
      beginShape();
      vertex(mouseX, mouseY);
      vertex(mouseX+47, mouseY+35);
      vertex(mouseX+29, mouseY+90);
      vertex(mouseX-29, mouseY+90);
      vertex(mouseX-47,mouseY+35);
      endShape(CLOSE);
    }
    //Drawing an empty pentagon
    if (shape == 15 && mouseX>125) {
      stroke(ink);
      strokeWeight(thickness);
      noFill( );
      beginShape();
      vertex(mouseX, mouseY);
      vertex(mouseX+47, mouseY+35);
      vertex(mouseX+29, mouseY+90);
      vertex(mouseX-29, mouseY+90);
      vertex(mouseX-47,mouseY+35);
      endShape(CLOSE);
    }
    //Drawing a full arrow to right
    if (shape == 13 && mouseX>125) {
      noStroke();
      fill(ink);
      beginShape();
      vertex(mouseX, mouseY);
      vertex(mouseX+50, mouseY);
      vertex(mouseX+50, mouseY-10);
      vertex(mouseX+75, mouseY+10);
      vertex(mouseX+50,mouseY+30);
      vertex(mouseX+50, mouseY+20);
      vertex(mouseX, mouseY+20);
      endShape(CLOSE);
    }
    //Drawing an empty arrow to right
    if (shape == 17 && mouseX>125) {
      stroke(ink);
      strokeWeight(thickness);
      noFill();
      beginShape();
      vertex(mouseX, mouseY);
      vertex(mouseX+50, mouseY);
      vertex(mouseX+50, mouseY-10);
      vertex(mouseX+75, mouseY+10);
      vertex(mouseX+50,mouseY+30);
      vertex(mouseX+50, mouseY+20);
      vertex(mouseX, mouseY+20);
      endShape(CLOSE);
    }
    //Drawing a full arrow to left
    if (shape == 14 && mouseX>125) {
      noStroke();
      fill(ink);
      beginShape();
      vertex(mouseX, mouseY);
      vertex(mouseX-50, mouseY);
      vertex(mouseX-50, mouseY-10);
      vertex(mouseX-75, mouseY+10);
      vertex(mouseX-50,mouseY+30);
      vertex(mouseX-50, mouseY+20);
      vertex(mouseX, mouseY+20);
      endShape(CLOSE);
    }
    //Drawing an empty arrow to left
    if (shape == 18 && mouseX>125) {
      stroke(ink);
      strokeWeight(thickness);
      noFill();
      beginShape();
      vertex(mouseX, mouseY);
      vertex(mouseX-50, mouseY);
      vertex(mouseX-50, mouseY-10);
      vertex(mouseX-75, mouseY+10);
      vertex(mouseX-50,mouseY+30);
      vertex(mouseX-50, mouseY+20);
      vertex(mouseX, mouseY+20);
      endShape(CLOSE);
    }
    //Drawing an empty hexagon
    if (shape == 16 && mouseX>125) {
      stroke(ink);
      strokeWeight(thickness);
      noFill();
      beginShape();
      vertex(mouseX, mouseY);
      vertex(mouseX+30, mouseY+20);
      vertex(mouseX+30, mouseY+50);
      vertex(mouseX, mouseY+70);
      vertex(mouseX-30,mouseY+50);
      vertex(mouseX-30, mouseY+20);
      endShape(CLOSE);
    }
    //Drawing an empty hexagon
    if (shape == 12 && mouseX>125) {
      noStroke();
      fill(ink);
      beginShape();
      vertex(mouseX, mouseY);
      vertex(mouseX+30, mouseY+20);
      vertex(mouseX+30, mouseY+50);
      vertex(mouseX, mouseY+70);
      vertex(mouseX-30,mouseY+50);
      vertex(mouseX-30, mouseY+20);
      endShape(CLOSE);
    }
}
//Key inputs
void keyReleased() {
  //New sheet
  if (key == ENTER || key == BACKSPACE) {
    background(white6);
    COLORS = loadImage("COULEURS.png");
    THICKNESS = loadImage("EPAISSEURS.png");
    SHAPES = loadImage("SHAPES.png");
    SHAPESS = loadImage("SHAPESS.png");
    SHAPESSS = loadImage("SHAPESSS.png");
    GOMME = loadImage("GOMME.png");    
  }
  //Screenshot
  if (key == 's' || key == 'S') saveFrame("screenshot.png");
}



 


