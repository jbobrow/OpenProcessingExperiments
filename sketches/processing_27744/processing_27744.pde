

//---------------------------------------------------------
//  sketch: TestCheckSum32.pde
//  descr.: test of function checkSum32() & checkString()  
//  date:   2011-04-29
//---------------------------------------------------------
void setup()
{
  size(412,210);
  textSize(18);
  background(155);
}
//---------------------------------------------------------
void draw() {repaint();}  // to call keyPressed() !!!
//---------------------------------------------------------
void keyPressed()
{
//  println ("'" +key +"'   " +int(key)+"   " +int(keyCode));
  int sl = ti.length();
  if ((key >= ' ') && (key <= 128) && (sl < 40))
    ti += key;
  else if ((keyCode == 8) && (sl > 0)) 
    ti = ti.substring(0,ti.length()-1);  
  repaint();
}
//---------------------------------------------------------
String ts = "String to test checkSum32()";
String ti = "";
int sx = 170;
//---------------------------------------------------------
void repaint()
{
  background(155);
  String csum = hex(checkSum32(ts));
  boolean ok = checkString (ts+csum);
  fill(0);
  text ("test of function checkSum32(string)",22,28);
  drawText ("text:", ts, sx,2);
  drawText ("checkSum32(text)", csum, sx,3);
  drawText ("checkString(text)", str(ok), sx,4);
  drawText ("text input:", ti, sx,5);
  drawText ("checkSum32(input)", hex(checkSum32(ti)), sx,6);
}
//---------------------------------------------------------
// draw string name and string
//---------------------------------------------------------
void drawText (String s1, String s2, int x, int y)
{ 
  y = y * 32;
  fill(222);
  rect (x-6,y-18, 240, 22);
  textAlign(RIGHT);
  fill (0);
  text (s1,x-10,y);
  textAlign(LEFT);
  text (s2,x,y);
}
//---------------------------------------------------------
// true if string with 8 characters checksum is okay
// example:  checkString("Test.559B4D2E") is true
//           checkString("wrong12345678") is false
//---------------------------------------------------------
boolean checkString (String aString)
{
  int strLen = aString.length();
  if (strLen <= 8) return false; 
  String cs1 = aString.substring(0,strLen-8);
  String cs2 = aString.substring(strLen-8);
  return (checkSum32(cs1) == unhex(cs2)); 
}
//---------------------------------------------------------
// build a simple 32 bit checksum of a string 
//---------------------------------------------------------
int checkSum32 (String cs)
{
  int sum32 = 0x12345678;
  for (int si=0; si<cs.length(); si++)
    sum32 = (sum32 << 5) + 5*byte(cs.charAt(si)) + 3*si;
  return sum32;  
}


