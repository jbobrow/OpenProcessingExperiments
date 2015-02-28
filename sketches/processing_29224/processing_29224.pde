
/*
 * This sketch shows how a ConcurrentModificationException may be 
 * generated.  Each time draw() is called, it will iterate through 
 * the 'list' ArrayList of Strings.  For each of those strings,
 * draw() will call drawString() to paint the string to the screen and  
 * then remove that string from the list -- while draw is still
 * working with the list!  So drawString() is modifying list while 
 * draw() is still working with it at the same time (or *concurrently*).
 *
 * This kind of behavior can lead to really bad consequences in a program
 * if a method is relying on there being items in a list while, 
 * concurrently, another method is making changes.  Java is attempting to 
 * prevent that from happening by throwing an exception.
 *
 * To see the exception happen, you will need to uncomment the 
 * line that reads
 *    list.remove(i)
 * in the drawString() method.
 *
 * 2011-05-21 mferraro 
 */

ArrayList<String> list;

void setup() {
  background(0);
  size(400,400);
  list = new ArrayList<String>();
  list.add("abc");
  list.add("def");
  list.add("ghi");
}

void draw() {
  for( String s : list ) {
    drawString( random(width-30), random(height-16) + 16, s );
  }
}

//put string str on screen @ (x,y)
//and then remove it from 'list'
void drawString(float x, float y, String str) {
  textSize(16);
  fill(random(255),random(255),random(255));
  text(str, x, y);
  
  //remove str from the list
  for( int i = list.size() - 1 ; i >= 0 ; i-- ) {
    if ( str.equals( list.get(i) ) ) {
      //list.remove(i);
    }
  }
  
}
  

