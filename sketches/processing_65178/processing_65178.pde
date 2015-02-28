
/******************************************
 *  Fridaynosaur, a Monster
 *
 *  Drew Mokris 07/2012
 ******************************************/

void setup() {
  size(500, 500); //size(width, height); in pixels
  smooth(); //this turns on anti-aliasing
  noStroke();
  noLoop();
}

void draw() {
  background(#000000);

  // background gradient
  for(int i = 0; i < 500; i+=20) {
     fill(i/10, i/5, 0);
     quad(0, i,
          width, i,
          width, i+20,
          0, i+20);
  }


  fill(#FFA61F);

  // top teeth
  int tooth_width = 25;
  int num_teeth = 5;
  int tooth_y_shift = (tooth_width/num_teeth);
  for(int i = 0; i < num_teeth*tooth_width; i+=tooth_width) {
    triangle(140+i, 140+(i/tooth_y_shift),
             170+i, 145+(i/tooth_y_shift),
             150+i, 230+(i/tooth_y_shift));
  }
  
  // bottom teeth
  for(int i = 0; i < num_teeth*tooth_width; i+=tooth_width) {
    triangle(150+i, 330,
             180+i, 330,
             165+i, 230);
  }
  
  quad(425, 162,
       395, 500,
       230, 500,
       283, 211);   

  ellipse(340, 160,
          170,
          170);

// horns  
  triangle(285, 100,
           270, 45,
           315, 85);
  triangle(400, 100,
           445, 65,
           415, 140);
  for(int i = 0; i < 3*17; i+=17){
    triangle(420-(i/5), 170+i,
             470-(i/5), 180+i,
             420-(i/5), 190+i);
  }

  // left arm
  quad(408, 300,
       450, 305,
       448, 330,
       408, 325);
  quad(447, 330,
       465, 333,
       478, 236,
       455, 232);
  for(int i = 0; i < 3*15; i+=15){
    triangle(455-(i/8), 232+i,
             420-(i/8), 235+i,
             460-(i/8), 250+i);
  }

  // right arm
  quad(203, 400,
       248, 405,
       245, 430,
       203, 425);
  quad(204, 425,
       180, 422,
       178, 345,
       203, 346);
  for(int i = 0; i < 3*16; i+=16){
    triangle(199+(i/8), 346+i,
             233+(i/8), 348+i,
             197+(i/8), 360+i);
  }


  // eyes
  fill(#FFFFFF);
  ellipse(280, 125,
          50,
          50); 
  ellipse(360, 170,
          50,
          50);
  fill(#000000);
  ellipse(269, 125,
          30,
          40); 
  ellipse(349, 170,
          30,
          40);
 // nostrils
  fill(#000000);
  quad(148, 148,
       160, 150,
       158, 157,
       146, 155);
  quad(178, 153,
       190, 155,
       188, 162,
       176, 160);

  // This is how I cheated:
  //println("(" + mouseX + ", " + mouseY + ")");
}


