
float a, b, c, a2, b2, c2 = 0;
float counter = 0;


void setup() {
  
size(345, 550);
smooth();
rect(0, 0, 345, 550);
fill(0);
}

void draw() {
  
  fill(255);
  rect(0, 0, 345, 550);
  
  fill(0);
  triangle(25+a,25,25,125-b,125-c,125); //1
  triangle(125+a,25,125,125-b,225-c,125); //2
  triangle(225+a,25,225,125-b,325-c,125); //3
  triangle(25+a,125,25,225-b,125-c,225); //4
  triangle(125+a,125,125,225-b,225-c,225); //5
  triangle(225+a,125,225,225-b,325-c,225); //6
  triangle(25+a,225,25,325-b,125-c,325); //7
  triangle(125+a,225,125,325-b,225-c,325); //8
  triangle(225+a,225,225,325-b,325-c,325); //9
  triangle(25+a,325,25,425-b,125-c,425); //10
  triangle(125+a,325,125,425-b,225-c,425); //11
  triangle(225+a,325,225,425-b,325-c,425); //12
  triangle(25+a,425,25,525-b,125-c,525); //13
  triangle(125+a,425,125,525-b,225-c,525); //14
  triangle(225+a,425,225,525-b,325-c,525); //15

  a = mouseY/5.5;
  b = mouseX/3.5;
  c = mouseY/5.5;
}
