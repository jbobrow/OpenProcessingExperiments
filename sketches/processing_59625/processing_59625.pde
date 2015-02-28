
XMLElement[] tweets;

int [] hourhisto = new int[24];
String[] hours;
  int xmargin = 60;
  float yscale = -56;

//int xmargin = 50;
//float yscale =  1.5;



void setup(){
  size(1500,900);
  XMLElement data = new XMLElement(this,"twdocs_com 2.xml");
  tweets = data.getChildren();
  println(tweets.length);
noLoop();
smooth();



}


void draw(){
 // translate(50,50);
 background(255); 
   PFont font;
  stroke(0);
  smooth();
   fill(30,144,255);
  text("Twitter Data visualisation", 60, 70);
  text("Hours spent on twitter",700,690);



  
  for (int i=0; i<tweets.length; i++){

    
    String created = tweets[i].getChild(1).getContent();
    String[] time = match(created,"..:..:..");
    int hr = int(time[0].substring(0,2));
    int realhr = (hr + 10)%24;
    println(realhr);
    hourhisto[realhr] ++;
  

  
  }
  
  //numbers
   for ( int h=0; h<hourhisto.length; h++){
     fill(30,144,255);
  
    text(hourhisto[h]*1,96-h*yscale,630,xmargin);   
//     text( h,  80-h*yscale,  xmargin);
//       text( h,  350 -h*yscale,  xmargin);
   
   
   
 }
  
  
  for (int h=0; h<hourhisto.length; h++){
   pushMatrix();
    translate(100,600);
    //rotate( h*TWO_PI/24.0);
    
    //translate(344,80);
    //fill(255,160,0);
    stroke(0,191,255);
  
   // rect(-10,0,20,hourhisto[h]*4);
//rect(hourhisto[h]*18,0,9,hourhisto[h]*-6);

rect(h*56,0,9,hourhisto[h]*-4);
line(1300, 2, 0, 2);

//line(hourhisto[h]*6,0,hourhisto[h]*6,hourhisto[h]*-6);



    
    popMatrix();
  
  }



}



