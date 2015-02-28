
PImage img1, img2;
int[] data = new int[700];
int time;
int old;
//String lines[];

void setup()
{
  size(800, 450);
  smooth();
  
  for (int i = 0; i < 100; i++) {
      data[i] = int(random(0,10));
  }
  for (int i = 100; i < 200; i++) {
      data[i] = (i-80)+int(random(0,40));
  }
  for (int i = 200; i < 500; i++) {
      data[i] = 100+int((i-80)/3)+int(random(0,50));
  }
  for (int i = 500; i < 650; i++) {
      data[i] = 750-int((i-80)*1.2) + int(random(0,60));
  }
  for (int i = 650; i < 700; i++) {
      data[i] = int(random(0,10));
  }
  time = 0;
  old = second();

  img1 = loadImage("http://psn.quake.net/solar/images/DailyGen2009.gif");
  img2 = loadImage("http://campus.udayton.edu/~nsbe/logo.gif");
  
 //String lines[] = loadStrings("http://192.168.1.177/");
 // println("there are " + lines.length + " lines");
//for (int i=0; i < lines.length; i++) {
  //println(lines[1]);
  
}

void draw()
{
  background(2,2,108);
  stroke(255);
  fill(255);
//text(second(), mouseX, mouseY);


  image(img2, 20, 330, 100, 100);
  fill (5);
  rect(20,20,755,300);
 
  
  if(old!=int(second()))
  {   time=time+20;
      old = int(second());}
  if(time > 700)
  {time = 0;}
  
  for (int i = 0; i < time; i++) {
      line(i+20,300-data[i],i+21,300-data[i+1]);
  }
  fill(255);
  text("Time",400,305);
  text("KW/H",25,200);
  //text(lines[1],2,2);
}
                                                                                                    
