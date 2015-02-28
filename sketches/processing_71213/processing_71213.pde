
void setup(){
  size(600,700);
  smooth();
}

void draw(){
  println("x: " +mouseX+ " y: " + mouseY);
  background(220,232,199);
  noStroke();
 fill(119,147,82);
 rect(25,20,550,60);
 fill(255,255,242);
 textSize(32);
 text("Number of Wild Horses by State",49,65);
 
   ellipse(300,550,20,20);
   ellipse(300,580,20,20);
   triangle(300,600,290,620,310,620);
   triangle(300,630,290,650,310,650);
   fill(119,147,82);
   textSize(12);
   text("33,102 total individuals",300,555);
   text("26,578 appropriate management level",300,585);
   text("40,291,021 BLM acres",300,615);
   text("51,315,142 total acres",300,645);
   
 
  //nevada
  fill(214,187,145);
  arc(300,400,250,250,radians(0),radians(180.99));
  //wyoming
  fill(140,201,199);
  arc(300,400,250,250,radians(180.99),radians(235.541));
  //california
  fill(231,232,122);
  arc(300,400,250,250,radians(235.541),radians(279.663));
  //oregon
  fill(218,186,240);
  arc(300,400,250,250,radians(279.663),radians(306.937));
  //utah
  fill(198,195,80);
  arc(300,400,250,250,radians(306.937),radians(334.071));
  //idaho
  fill(222,206,119);
  arc(300,400,250,250,radians(334.071),radians(344));
  //colorado
  fill(169,190,209);
  arc(300,400,250,250,radians(344),radians(352.396));
 //arizona
  fill(232,164,204);
  arc(300,400,250,250,radians(352.396),radians(356.637));
 //montana
  fill(164,180,127);
  arc(300,400,250,250,radians(356.637),radians(358.758)); 
  //new mexico
  fill(149,151,216);
  arc(300,400,250,240,radians(358.758),radians(360));
  
  stroke(72,69,64);
  fill(72,69,64);
  line(250,450,150,550);
  textSize(12);
  text("Nevada: 16,642",140,565);
  
  line(100,320,230,370);
  text("Wyoming: 5,016",80,310);
  
  line(200,220,280,300);
  text("California: 4,057",170,210);
  
  line(336,188,344,310);
  text("Oregon: 2,508",290,174);
  
  line(384,334,464,278);
  text("Utah: 2,495",409,270);
  
  line(462,350,409,360);
  text("Idaho: 913",470,350);
  
  line(412,377,466,373);
  text("Colorado: 772",475,375);
  
  line(418,388,454,390);
  text("Arizona: 390",463,395); 
  
  line(420,395,463,418);
  text("Montana: 195",469,420);
  
  line(411,400,457,453);
  text("New Mexico: 114",464,456);
 
}

