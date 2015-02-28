

int y;
void setup() {
  size(900, 300);
 
  
}

void draw() {
  
  //Sky
    fill(198,100,146);
    rect(0,0,900,300);
  //first building back lft
    fill(189, 160, 193); //side color
    quad(0, 150, 10, 147, 10, 217, 0, 217);//side
    fill(121, 99, 121);//front color
    rect(10, 147, 18, 70);//front
  
  //second building back lft
    fill(203, 197, 203); //side color
    quad(25, 147, 29, 135, 29, 217, 25, 217);//side
    fill(150, 135, 152);//front color
    rect(29, 135, 38, 83); //front
    
  //third building back left   
    fill(245, 222, 173); //side color
    quad(100, 45, 109, 40, 109, 75, 100, 75);//side
    quad(95, 55, 109, 50, 109, 75, 95, 75);//side
    quad(90, 65, 109, 60, 109, 155, 90, 155);//side
    line(112, 20, 112, 40);
    fill(183, 160, 109); //front color
    rect(109, 40, 12, 50); //front
    rect(109, 50, 16, 50); //front
    rect(109, 60, 20, 155); //front
    
  //third bilding in front of back building
    fill(121, 108, 53);
    rect(109, 115, 35, 100); //front
    triangle(130, 105, 109, 115, 144, 115);
  //next to tower bar back                    Tan
    fill(229, 184, 86);
    rect(165, 75, 22, 100); //side
    fill(131, 121, 81);
    rect(182, 75, 22, 100); //side
  //next to towner, infront of back building    Brown
    fill(201, 170, 101);
    quad(160, 105, 170, 100, 170, 155, 160, 155);//side
    fill(152, 118, 45);
    rect(170, 100, 18, 60); //front

  //tower forth from lft                    Purple
    fill(0, 0, 0);
    rect(155, 90, 5, 120); //post
    fill(197, 139, 206);
    rect(148, 65, 15, 15); //upper-tower
    fill(144, 76, 155);
    rect(145, 75, 21, 15); //lower-tower

  //large building fifth from lft          Redish-brown
    fill(206, 127, 127); //side color
    quad(185, 33, 200, 25, 200, 175, 185, 175);//side
  
    fill(157, 65, 65); //front color
    rect(200, 25, 42, 150); //front
  
    fill(206, 127, 127); //side color
    quad(215, 45, 225, 42, 225, 165, 215, 165);//side
  
    fill(157, 65, 65); //front color
    rect(225, 42, 40, 150); //front

  //short 6th building from lft
    fill(229, 184, 86);
    quad(158, 140, 170, 135, 170, 217, 158, 217);//side
    fill(131, 121, 81);
    rect(170, 135, 28, 75); //side
  //bushes
    fill(68,95,49);
    ellipse(20, 225, 75, 65);
  // behind short building to the right of dome  Grey
    fill(96,96,76);
    rect(320, 170, 30, 65); //front
  //short building to the right of dome          Lt Green  
    fill(152,158,73);
    rect(270, 135, 50, 75); //front
    triangle(300, 105, 265, 135, 320, 135);
  //9th                                            Blue
    fill(33,104,142);
    rect(350, 160, 45, 75); //front
    triangle(370, 150, 350, 160, 395, 160);
    
  //behind middle of scene
    fill(88,224,77);
    rect(410, 95, 25, 85); //front
  //10th from left                                Pink
    fill(209,166,204);
    rect(395, 150, 25, 85); //front
  //11th from left TALL                            tan
    fill(234,230,192);
    quad(420, 90, 435, 80, 435, 235, 420, 235);//side
    fill(183,166,11);
    rect(435, 80, 50, 155); //front
  //12th from left                                Med-green
    fill(108,104,67);
    rect(485, 135, 50, 100); //front
  //14th behind 13th                           purple
    fill(151,89,160);
    rect(535, 80, 95, 155); //front
  //13th from left                                Dk-Grey
    fill(160,159,156);
    quad(525, 145, 535, 140, 535, 235, 525, 235);//side
    fill(98,98,98);
    rect(535, 140, 50, 95); //front
  //15th from left                              Orange
    fill(188,130,93);
    quad(615, 145, 635, 140,635, 235, 615, 235);//side
    fill(198,72,2);
    rect(635, 140, 30, 95); //front
  //17th from left                              Dk grey
    fill(85,83,84);
    rect(695,185, 30, 50); //front
  //16th from left                                Brugandy
    fill(222,159,174);
    quad(665, 110, 675, 100,675, 235, 665, 235);//side
    fill(155,20,52);
    rect(675, 100, 30, 135); //front
  //18th from left                              Dk-Blue
    fill(144,145,157);
    quad(715, 120, 725, 110,725, 235, 715, 235);//side
    fill(61,63,129);
    rect(725, 110, 40, 125); //front
  
  
  
  
  //Opera dome lft
      fill(255);
      arc(190, 225, 50, 115, PI, TWO_PI);
    //Large
      fill(129, 81, 124);
      triangle(108, 105, 45, 225, 175, 225);
      fill(0, 0, 0);
      triangle(108, 120, 50, 225, 170, 225);
    //medium 
      fill(129, 81, 124);
      triangle(105, 140, 45, 225, 175, 225);
      fill(0, 0, 0);
      triangle(105, 150, 50, 225, 170, 225);
  
    //small 
      fill(129, 81, 124);
      triangle(103, 160, 45, 225, 175, 225);
      fill(0, 0, 0);
      triangle(103, 170, 50, 225, 170, 225);
  
  //Dome right
    //Large
      fill(129, 81, 124);
      triangle(250, 100, 160, 225, 320, 225);
      fill(0, 0, 0);
      triangle(250, 110, 170, 225, 315, 225);
    //medium 
      fill(129, 81, 124);
      triangle(270, 130, 175, 225, 330, 225);
      fill(0, 0, 0);
      triangle(270, 140, 185, 225, 325, 225);
    //small 
      fill(129, 81, 124);
      quad(260, 160, 290, 150, 340, 225, 195, 225);
      triangle(290, 150, 220, 225, 340, 225);
      fill(0, 0, 0);
      triangle(290, 160, 230, 225, 335, 225);
  //center bottom wall
      fill(12,12,12);
      rect(340, 235, 450, 30);
      
      fill(72,71,71);
      rect(340, 250, 230, 10);
      rect(640, 250, 150, 10);
      fill(137,135,135);
      rect(340, 240, 200, 10);
      rect(660, 240, 130, 10);
      
    //bottom of opera
      fill(129, 81, 124);
      rect(45, 225, 115, 30);
      quad(160, 225, 230, 222, 230, 255, 160, 255);
      quad(230, 222, 340, 225, 340, 255, 230, 255);

  //retaining wall for opera
    fill(157,99,5);
    rect(0, 250, 115, 15);
    rect(45, 250, 115, 15);
    quad(160, 250, 230, 247, 230, 265, 160, 265);
    quad(230, 250, 340, 247, 340, 265, 230, 265);

  //Water
  fill(15,60,147);
    rect(0,263,900,45);





  save("sidney.jpg");
}




