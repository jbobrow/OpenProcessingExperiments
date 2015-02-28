
//FINAL by: Emily Gorman
//Data from: http://www-958.ibm.com/software/data/cognos/manyeyes/datasets/how-long-certain-drugs-stay-in-you-2/versions/1.txt
//background image: http://images2.layoutsparks.com/1/123471/pin-paisley-stripes-design.jpg

PImage myBackground;
PImage myPill;
PFont myFont;
String[] data;

void setup(){
  size(1058,800);
  smooth();
  myBackground = loadImage("paisley.jpg");
  myFont = loadFont("myfont1.vlw");
  myPill = loadImage("PILL2.png");
  data = loadStrings("drug_data_final");
  
  
}

void drugVis(){
  image(myBackground,0,0);
  
}

void draw(){
  image(myBackground,0,0);
  textFont(myFont,24);
  image(myBackground,500,0);
  image(myBackground,0,400);
  image(myBackground,500,400);
  image(myBackground,800,0);
  image(myBackground,800,400);
  fill(22,103,240);
  text("DURATION OF DRUG EFFECT (measured in day(s)",10,70);
  for(int i =0; i < 8; i++){
    String[] pieces = split(data[i],TAB);
    String x = pieces[1];
    float y = parseFloat(pieces[2]);
    image(myPill,i*60,200,100,100);
    float s = parseFloat(pieces[0]);
  
  if(dist(mouseX,mouseY,i*60,200) < 40){
    textFont(myFont,40);
    fill(0);
    text(pieces[1],100,s*50);
    text(pieces[2],650,s*50);
    image(myPill,i*60,200,100,100);
    
    
   


} 
  }

  for(int i =9; i < 17; i++){
    String[] pieces = split(data[i],TAB);
    String x = pieces[0];
    float y = parseFloat(pieces[1]);
    image(myPill,i*60,400,100,100);
    
    float s = parseFloat(pieces[0]);
   
   if(dist(mouseX,mouseY,i*60,400) < 40){
    textFont(myFont,40);
    fill(0);
    text(pieces[1],100,s*50);
    image(myPill,i*60,400,100,100);
    text(pieces[2],550,s*50);
    
}
  }
}

 
 





