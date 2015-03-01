
String[] ancre1 =
{"Boat","River","Tangerine","Marmalade skies","The sky","Parrot wing","Plasticine porters","Looking-glass ties","Dream","Trip","Dying stars smiling","Inletting the sky"};
String[] ancre2 =
{"Boat","River","Tangerine","Marmalade skies","The sky","Parrot wing","Plasticine porters","Looking-glass ties","Dream","Trip","Dying stars smiling","Inletting the sky"};
String[] ancre3 =
{"Boat","River","Tangerine","Marmalade skies","The sky","Parrot wing","Plasticine porters","Looking-glass ties","Dream","Trip","Dying stars smiling","Inletting the sky"};

PFont mapolice;

void setup()
{
 size(720,480);
 background(255);
 smooth();
 fill(0);

 mapolice = loadFont("ACaslonPro-Bold-48.vlw");
 textFont(mapolice,24);
 textAlign(CENTER);
 text ("Picture yourself...", width/2, height/2);
}

void draw()
{
 if (mousePressed)
 {
  background(255);
  text (ancre1[int(random(0,ancre1.length))] + " " + " " + " " +  
  ancre2[int(random(0,ancre2.length))]+ " " + " "+ " " + ancre3[int(random(0,ancre3.length))], width/2, height/2);
 } 
 println(mouseX+ mouseY);
}





