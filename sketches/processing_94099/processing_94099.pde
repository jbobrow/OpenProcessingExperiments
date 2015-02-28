
boolean selected;
int[][] data = new int[4][];
String[][] strings = new String[4][];
int total=694193;
int distance=0;
int category=data.length;
boolean first=true;


void setup() {
  frameRate(60);
  size(500, 600);
  colorMode(HSB);
  data[0]=new int[3];
  strings[0]=new String[3];
  data[0][0] = 316561;
  strings[0][0] = "Male";
  data[0][1] = 377581;
  strings[0][1] = "Female";
  data[0][2] = 51;
  strings[0][2] = "Unknown";


  data[1]=new int[13];
  strings[1]=new String[13];
  data[1][0] = 9570;
  strings[1][0] = "18 to 19 years";
  data[1][1] = 58357;
  strings[1][1] = "20 to 24 years";
  data[1][2] = 86351;
  strings[1][2] = "25 to 29 years";
  data[1][3] = 91896;
  strings[1][3] = "30 to 34 years";
  data[1][4] = 101522;
  strings[1][4] = "35 to 39 years";
  data[1][5] = 89063;
  strings[1][5] = "40 to 44 years";
  data[1][12] = 67921;
  strings[1][12] = "45 to 49 years";
  data[1][7] = 56112;
  strings[1][7] = "50 to 54 years";
  data[1][8] = 45422;
  strings[1][8] = "55 to 59 years";
  data[1][9] = 31490;
  strings[1][9] = "60 to 64 years";
  data[1][10] = 39507;
  strings[1][10] = "65 to 74 years";
  data[1][11] = 16980;
  strings[1][11] = "75 years and over";
  data[1][6] = 2;
  strings[1][6] = "Unknown";

  data[2]=new int[5];
  strings[2]=new String[5];
  data[2][0] = 151750;
  strings[2][0] = "Single";
  data[2][1] = 446686;
  strings[2][1] = "Married";
  data[2][2] = 21708;
  strings[2][2] = "Widowed";
  data[2][3] = 67699;
  strings[2][3] = "Divorced/separated";
  data[2][4] = 6350;
  strings[2][4] = "Unknown";

  data[3]=new int[9];
  strings[3]=new String[9];
  data[3][0] = 138496;
  strings[3][0] = "Management, professional,\nand related occupations";
  data[3][1] = 82638;
  strings[3][1] = "Service\noccupations";
  data[3][2] = 57955;
  strings[3][2] = "Sales and office\noccupations";
  data[3][3] = 13849;
  strings[3][3] = "Construction, extraction, maintenance\nand repair occupations";
  data[3][4] = 69533;
  strings[3][4] = "Production, transportation, and\nmaterial moving occupations";
  data[3][5] = 3986;
  strings[3][5] = "Military";
  data[3][6] = 187651;
  strings[3][6] = "No occupation/\nnot working\noutside\nhome";
  data[3][7] = 2285;
  strings[3][7] = "Farming, fishing, and\nforestry\noccupations";
  data[3][8] = 137800;
  strings[3][8] = "Unknown";
}
void draw() {

  if (category!=data.length) {
    background(0);
    pushMatrix();
    if (distance<50) {
      distance+=2;
    }
    translate(250, 250);
    float totalAngle=0;
    for (int i = 0; i < data[category].length; i++) {
      stroke(i*255.0/data[category].length, 255, 255);
      float angle = (float)(1.0*data[category][i]/total*2*Math.PI);
      totalAngle-=angle/2;
      rotate(-angle/2);
      //    line(0, distance, -100*sin(angle/2), 100*cos(angle/2)+distance);
      //    line(0, distance, 100*sin(angle/2), 100*cos(angle/2)+distance);
      fill(i*255.0/data[category].length, 255, 255);
      arc(0, distance, 200, 200, (float)Math.PI/2-angle/2, (float)Math.PI/2+angle/2);
      if (distance>=50) {
        rotate(-totalAngle);
        text(strings[category][i], -200*sin(totalAngle)-25, 200*cos(totalAngle));
        rotate(totalAngle);
      }
      //curve(0, 0+distance, -100*sin(angle/2), 100*cos(angle/2)+distance, 100*sin(angle/2), 100*cos(angle/2)+distance, 0, 0+distance);
      rotate(-angle/2);
      totalAngle-=angle/2;
    }
    popMatrix();
    fill(25, 255, 255);
    rect(0, 500, 125, 600);
    fill(25, 255, 255);
    rect(125, 500, 250, 600);
    fill(25, 255, 255);
    rect(250, 500, 375, 600);
    fill(25, 255, 255);
    rect(375, 500, 500, 600);
    fill(255);
    text("By Gender", 40, 550);
    text("By Age", 170, 550);
    text("By Marital Status", 269, 550);
    text("By Occupation", 400, 550);
    fill(0);
    text("PERSONS NATURALIZED BY GENDER, AGE, MARITAL STATUS, AND OCCUPATION", 15, 580);
    text("FISCAL YEAR 2011", 210, 592);
  }
  else {
    background(0);
    text("PERSONS NATURALIZED BY GENDER, AGE, MARITAL STATUS, AND OCCUPATION", 15, 290);
    text("FISCAL YEAR 2011", 210, 305);
    text("By Gender", 110, 150);
    text("By Age", 120, 450);
    text("By Marital Status", 300, 150);
    text("By Occupation", 300, 450);
  }
}
void mouseClicked() {
  if (first) {
    first=false;
    if (mouseX<width/2) {
      if (mouseY<height/2) {
        category=0;
      }
      else {
        category=1;
      }
    }
    else {
      if (mouseY<height/2) {
        category=2;
      }
      else {
        category=3;
      }
    }
  }
  else if (distance==50&&mouseY>500) {
    distance=0;
    if (mouseX<width/4) {
      category=0;
    }
    else if (mouseX<2*width/4) {
      category=1;
    }
    else if (mouseX<3*width/4) {
      category=2;
    }
    else if (mouseX<width) {
      category=3;
    }
  }
}



