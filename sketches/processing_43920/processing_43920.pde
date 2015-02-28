
//dana gloria
//midterm sketch 1
//www.disastercenter.com/crime

PImage myMap;

void setup() {
  size (640, 400); 
  smooth();
  myMap = loadImage ("map.png"); 
  mapVis ();

}
void draw () {
  mapVis ();
}
  

void mapVis() { 
    tint(66);

  image(myMap,0,0); 

  String[] data = loadStrings("locations.tsv");
  for(int i = 0; i < data.length; i++) {
    String [] pieces = split(data[i],TAB);
     float x = parseFloat(pieces[1]); 
     float y = parseFloat(pieces[2]);
     fill(234,64,21); 
     ellipse(x,y,8,8); 
     stroke(0,255,0);
 
   PFont font;
  
  fill(157,10,19);
  
  font = loadFont ("Nec.vlw"); 
  smooth();
  textFont(font,32);
  text("2010 U.S. Murder Rates",230,40); 

 
fill(0);
  font= loadFont ("Cen.vlw") ; 
  textFont(font, 10); 
  text("Alabama", 430, 252);
 fill(255);
  text("1.9%", 430, 262);
  
  fill(0); 
  text("Alaska", 94, 325); 
  fill(255); 
  text("0.2%",94,335); 
  
  fill(0); 
  text("Arizona", 150,241); 
  fill(255);
  text("2.8%", 150,250); 
  
  fill(0); 
  text("Arkansas", 368,247);
  fill(255); 
  text("0.9%", 368, 257); 
  
  
  fill(211,4,4); 
  text("California", 56,190);
  fill(255); 
  text(" 12.3%",56,200); 
  
  fill(0); 
  text("Colorado", 215,183);
  fill(255); 
  text ("0.8%",220,193); 
 
 fill(0); 
 text("Connecticut", 576,120);
 fill(255); 
 text(" 0.9%", 590, 130); 
  
   fill(0); 
  text("Delaware", 580,175);
  fill(255); 
  text(" 0.3%",590,185); 
  
  fill(211,4,4); 
  text("Florida", 505,320);
  fill(255); 
  text(" 6.7%", 515,330); 
 
 fill(0); 
  text("Georgia", 478,283);
  fill(255); 
  text(" 3.8%", 478,293); 
  
  fill(0); 
  text("Hawaii", 232,370);
  fill(255); 
  text(" 0.2%", 232,380); 
 
  
   fill (0); 
  text("Idaho", 143,101);
  fill(255); 
  text(" 0.1%",143,111); 
  
     fill (211,4,4); 
     text("Illinois", 403,185);
     fill(255); 
  text(" 4.8%", 410,195); 
  
      fill (0); 
      text("Indiana",420,150);
      fill(255); 
  text(" 1.9%", 420,160); 
  
     fill (0); 
     text("Iowa", 357,147);
     fill(255); 
  text(" 0.3%",357,157);
  
      fill (0); 
      text("Kansas", 302,194);
      fill(255); 
  text(" 0.7%", 302,204); 
  
     fill (0); 
     text("Kentucky", 453,203);
     fill(255); 
  text(" 1.3%", 453, 213); 
   
   
   fill (0); 
   text("Louisiana", 365,312);
   fill(255); 
  text(" 3.5%", 365, 322); 
  
     fill (0); 
     text("Maine", 595,40);
     fill(255); 
  text(" 0.2%", 595,50); 
  
     fill (0); 
     text("Maryland", 538,165);
     fill(255); 
  text("2.9%", 538, 175); 
  
     fill (0); 
     text("Massachusetts",565,80);
     fill(255); 
  text("1.4%" , 590,90); 
  
    fill (0); 
    text("Michigan", 446,110);
    fill(255); 
  text(" 3.8%",446,120); 
  
 
    fill (0); 
 text("Minnesota", 339,86);
 fill(255); 
  text(" 0.7%", 339,96); 
  
  
    fill (0); 
 text("Mississippi", 406,285);
 fill(255); 
  text(" 1.4%", 406,295); 
  
  
    fill (0); 
 text("Missouri", 365,197);
 fill(255); 
  text("2.8%", 365,207); 
  
  
    fill (0); 
 text("Montana", 194,61);
 fill(255); 
  text("0.2%", 194, 71); 
  
 
    fill (0); 
 text("Nebraska", 286,151);
 fill(255); 
  text(" 0.4%", 286,161); 
  
  
    fill (0); 
 text("Nevada",102,147);
 fill(255); 
  text(" 1.1%", 102,157); 
  
 
    fill (0); 
 text("New Hampshire", 560,60);
 fill(255); 
  text(" 0.09%", 590,70); 
  
   
    fill (0); 
 text("New Jersey",565,140);
 fill(255); 
  text(" 2.5%", 590,150); 
  
 
    fill (0); 
 text("New Mexico",208,245);
 fill(255); 
  text(" 0.9%", 208,255); 
  
 
    fill (211,4,4); 
 text("New York", 515,105);
 fill(255); 
  text(" 5.9%", 515,115);
  
  
    fill (0); 
 text("North Carolina", 519,230);
 fill(255); 
  text(" 3.2%", 519,240); 
  
  
    fill (0); 
    text("North Dakota", 283,65);
    fill(255); 
  text(" 0.07%", 283,75); 
  
  
     fill (0); 
text("Ohio", 465,140);
fill(255); 
  text(" 3.2%", 465,150);
  
  
     fill (0); 
text("Oklahoma", 309,239);
fill(255); 
  text("1.3%", 309,249); 
  
 
    fill (0); 
 text("Oregon",74,86);
 fill(255); 
  text(" 0.6%", 74,96);
  
  
     fill (0); 
text("Pensylvania", 500,140);
fill(255); 
  text(" 4.5%", 500,150); 
  
  
     fill (0); 
text("Rhode Island", 570,100);
fill(255); 
  text(" 0.2%", 590,110); 
  
 
     fill (0); 
text("South Carolina", 506,260);
fill(255); 
  text(" 0.04%", 506,270); 
  
  
     fill (0); 
text("South Dakota", 286,109);
fill(255); 
  text(" 0.2%", 286,119); 
  
    fill (0); 
    text("Tennessee",441,229);
    fill(255); 
  text(" 2.4%", 441,239);
  
  
     fill (211,4,4); 
text("Texas", 296,290);
fill(255); 
  text(" 8.5%",296,300); 
  
  
     fill (0); 
text("Utah", 154,171);
fill(255); 
  text(" 0.4%", 154,181); 
  
 
     fill (0); 
text("Vermont", 517,80);
fill(255); 
  text(" 0.05%", 517,90); 
  
 
    fill (0); 
 text("Virginia", 530,200);
 fill(255); 
  text(" 2.5%", 530,210); 
  
  
     fill (0); 
text("Washington", 92,38);
fill(255); 
  text(" 1.03%", 92,48); 
  
 
     fill (0); 
text("West Virginia", 470,175);
fill(255); 
  text(" 0.4%", 470,185); 
  
  
    fill (0); 
 text("Wisconsin", 392,103);
 fill(255); 
  text(" 1.05%", 392,113); 
  
 
    fill (0); 
 text("Wyoming", 207,115);
 fill(255); 
  text(" 0.05%", 207, 125); 
  
 fill(185,185,185);
  text("www.disastercenter.com/crime", 485,390);


  }
}
  void mousePressed(){
 fill (255,0,0); 
  
} 

void mouseReleased () { 
  fill (0,255,0); 
}
    








     

  





  




