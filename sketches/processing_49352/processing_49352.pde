
//alexander uhrich
//midterm
//nick lally
//source: national highway traffic safety administration
//fatality analysis
//dui-usa.drinkdriving.org
//modeled off stephanie pence's midterm


int minnesota[] = {212,156,163,149,173,135};
int wisconsin[]={324,297,322,307,314,208};
String years[]= {"2003","2004","2005","2006","2007","2008"};
PImage mn;
PImage wi;
 
  
void setup (){
  mn= loadImage("minnesota.jpg");
  wi= loadImage("Wisconsin.jpg");
  
  background(255,255,255);
  size(900,800);
  smooth();
}
  
void draw(){
  
 background(255,255,255);
 for(int i = 0; i< minnesota.length; i++){
   println(minnesota[i]);
 float MNimageSize=map(minnesota[i],10,130,0,50);
 image(mn,i*100+150,160,MNimageSize,MNimageSize);
 for(int x = 0; x<wisconsin.length; x++){
   println(wisconsin[x]);
 float WIimageSize=map(wisconsin[x],0,300,0,120);
 image(wi,x*100+150,380,WIimageSize,WIimageSize);
 

text(minnesota[i],i*100+160,150);
text(wisconsin[i], i*100+160, 300);
 
fill(0);
text(years[i],i*100+150,70);
 
text("MINNESOTA",30,160);

text("WISCONSIN", 30,300);

text("DEATHS IN WHICH AT LEAST ONE DRIVER WAS DRUNK", 20,40);
    
 }
  
 
}
      
 
 
}

