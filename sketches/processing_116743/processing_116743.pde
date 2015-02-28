
PFont font1, font2;

String p0 = "Even everyone laughing";
String p1 = "Dream greatly!";
String p2 = "that nobody can have dreamed,since begin in this world!";
String p3 = "Even never be loved";
String p4 = "Love constantly!";
String p5 = "like the sun, whenever morning comes always rising up!";
String p6 = "Even everyone doubting";
String p7 = "Believe firmly!";
String p8 = "the facts not only your possibility, but the God give blessing!";
String p9 = "Even never success";
String p10 = "Live fairly!";
String p11 = "as if your darling always watch you, even now!";
String p12 = "Once more repeat!";
String p13 = "Even if no one is listening,";
String p14 = "for keep this in my heart!";


int page = 0;

void setup(){
  size(600,600);
  font1 =loadFont("Calibri-48.vlw");
  font2 =loadFont("Constantia-Bold-48.vlw");
}

void draw(){
  textAlign(CENTER);
  
if (page == 0){  
  background(#CEB9B9);
  textFont(font2,20);
  text (p0, width/2, height/2);
}else if(page == 1){ 
  background(#989292);
  textFont(font2,20);
  text (p1, width/2, height/2);
}else if(page == 2){
  background(#C6C6C6);
  textFont(font1,20);
  text (p2, width/2, height/2);
}else if(page == 3){
  background(#796868);
  textFont(font2,20);
  text (p3, width/2, height/2);
}else if(page == 4){
  background(#8E6B6B);
  textFont(font2,20);
  text (p4, width/2, height/2);
}else if(page == 5){
  background(#CEB9B9);
  textFont(font1,20);
  text (p5, width/2, height/2);
}else if(page == 6){
  background(#403B3B);
  textFont(font2,20);
  text (p6, width/2, height/2);
}else if(page == 7){
  background(#C6C6C6);
  textFont(font2,20);
  text (p7, width/2, height/2);
}else if(page == 8){
  background(#796868);
  textFont(font1,20);
  text (p8, width/2, height/2);
}else if(page == 9){
  background(#CEB9B9);
  textFont(font2,20);
  text (p9, width/2, height/2);
}else if(page == 10){
  background(#403B3B);
  textFont(font2,20);
  text (p10, width/2, height/2);
}else if(page == 11){
  background(#C6C6C6);
  textFont(font1,20);
  text (p11, width/2, height/2);
}else if(page == 12){
  background(#8E6B6B);
  textFont(font2,20);
  text (p12, width/2, height/2);
}else if(page == 13){
  background(#796868);
  textFont(font2,20);
  text (p13, width/2, height/2);
}else if(page == 14){
  background(#C6C6C6);
  textFont(font2,20);
  text (p14, width/2, height/2);
}
}

void mousePressed(){
  if (page==0){
    page =int(random(1,14));
}else if (page==1){
    page =int(random(2,0));
}else if (page==2){
    page =int(random(3,1));
}else if (page==3){
    page =int(random(4,2));
}else if (page==4){
    page =int(random(5,3));
}else if (page==5){
    page =int(random(6,4));
}else if (page==6){
    page =int(random(7,5));
}else if (page==7){
    page =int(random(8,6));
}else if (page==8){
    page =int(random(9,7));
}else if (page==9){
    page =int(random(10,8));
}else if (page==10){
    page =int(random(11,9));
}else if (page==11){
    page =int(random(12,10));
}else if (page==12){
    page =int(random(13,11));
}else if (page==13){
    page =int(random(14,12));
}else if (page==14){
    page =int(random(0,13));
}

}
