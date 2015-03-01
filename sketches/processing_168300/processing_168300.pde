
////////////////////////////////////////////
//  random walker
////////////////////////////////////////////
 
Walker w;
/////
void setup(){
  size(500,360);
  colorMode(HSB);    //è�²æ��å®�ã�¯HSBã�¢ã�¼ã��
  w = new Walker();  // ã�ªã��ã�¸ã�§ã�¯ã�� w ã�®ç��æ��
  background(150);
}
/////
void draw(){
  w.step();          //ã�ªã��ã�¸ã�§ã�¯ã�� w ã�«æ­©ã��ã��ã��
  w.display();       //ã�ªã��ã�¸ã�§ã�¯ã�� w ã�«è�ªå��ã��è¡¨ç¤ºã��ã�¦ã��ã��ã��
  w.mousePress();
  w.press_ellipse();
}
/////
///// ã�¯ã�©ã�¹å®�ç¾©
class Walker{
  float x;      //ç�¶æ��å¤�æ�°
  float y;      //ç�¶æ��å¤�æ�°
  float tx, ty; //ã��ã�¼ã�ªã�³ã��ã�¤ã�ºç�¨
  int high_X, high_Y, low_X, low_Y, level;
  
  Walker(){
    tx = 0;
    ty = 10000;
  }
  void display(){ //è¡¨ç¤ºç�¨ã�¡ã�½ã��ã��
    fill(tx*100%256,255,255);  //è�²æ��å®�
    ellipse(x, y, 20, 20);     //å��ã��æ��ç�»
  }
  void step(){    //ã��æ­©ã��ã��ã�¡ã�½ã��ã��
    x = map(noise(tx), 0, 1, 0, width);  //ã��ã�¼ã�ªã�³ã��ã�¤ã�º
    y = map(noise(ty), 0, 1, 0, height); //ã��ã�¼ã�ªã�³ã��ã�¤ã�º
    tx += 0.01;
    ty += 0.01;
  }
   void mousePress() {
    if (mousePressed && (mouseButton == LEFT)) {
    x = map(noise(tx), 0, 1, 0, width);  //ã��ã�¼ã�ªã�³ã��ã�¤ã�º
    y = map(noise(ty), 0, 1, 0, height); //ã��ã�¼ã�ªã�³ã��ã�¤ã�º
    tx += 0.04;
    ty += 0.04;
    }  
  }
   void press_ellipse() {
     level = 20;
     int i = 100
     high_X = mouseX + level;
     high_Y = mouseY + level;
     low_X = mouseX - level;
     low_Y = mouseY - level;
     if ((high_X > x) && (x > low_X) && (high_Y > y) && (y > low_Y) && (mousePressed)){
        for(float z = 100.0 ; z > 0.0; z = z-10.0){ 
             fill(tx*z%256,255,255);
             ellipse(x, y, z, z);
             }
         }
         
   }
                
    
}

  




/////
/*class BigNoise{
  float x;
  float y;
  folat tx, ty;
  
  Walker(){
    tx = 0;
    ty = 10000;
  }
*/
 


