

int IMGHEIGHT;
int IMGWIDTH;
PFont myFont;
String quote="I have nothing to say and I am saying it";
String quoteArray[]=quote.split(" ");
String[] fontList;
  int q=1;


void setup() 
{

  IMGHEIGHT=600;
  IMGWIDTH=800;

  frameRate(12);
 
 // String[] fontList = PFont.list();
//  println(fontList);

  fontList = PFont.list();
  size(IMGWIDTH,IMGHEIGHT);
  background(255,255,255);
}
void draw()
{

  if (int(random(100))<10){
      filter(BLUR);
  }
  int start;
  int end;

    myFont = createFont(fontList[int(random(fontList.length))], (IMGHEIGHT+1)/10);
  textFont(myFont);
color c=color(int(random(200)),int(random(200)),int(random(200)),int(random(200)));
fill(c);
tint(255,255,255,10);
textSize(int((random(IMGHEIGHT)+1)/10));


 start=int(random(quoteArray.length));
end=start + int(random(quoteArray.length - start));
String result ="";
for (int i=start;i<=end;i++){
  result=result + " " + quoteArray[i];
   
 
}
text(result, int(random(IMGWIDTH)), int(random(IMGHEIGHT)));
  

 }




  
 
  

 void keyPressed()
{
   // if ( key == 's' ) save(str(millis())+".jpg");
    if ( key == 'r' ) setup();
}

