


PImage opentemplate;
PImage photo1;
PImage photo2;
PImage photo3;
PImage photo4;
PImage photo5;
float x, y, r;
void setup()
{
  size(640, 480);
  smooth();
  background(255);
  opentemplate = loadImage("OPENtemplate.png");
  photo1 = loadImage ("photo1.jpg");
  photo2 = loadImage ("photo2.jpg");
  photo3 = loadImage ("photo3.jpg");
  photo4 = loadImage ("photo4.jpg");
  photo5 = loadImage ("photo5.jpg");

  smooth();
  noLoop();
  imageMode(CENTER);
}
 
void draw()
{
   
   
  x = random(width);
  y = random(height);
  r = random(0, 60);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(photo1, photo1.width/2, photo1.height/2);
  popMatrix();
   
  x = random(width);
  y = random(height);
  r = random(0, 60);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(photo2, photo2.width/2, photo2.height/2);
  popMatrix();
   
  x = random(width);
  y = random(height);
  r = random(0, 60);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(photo3, photo3.width/2, photo3.height/2);
  popMatrix();
   
  x = random(width);
  y = random(height);
  r = random(0, 60);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(photo4, photo4.width/2, photo4.height/2);
  popMatrix();
   
  x = random(width);
  y = random(height);
  r = random(0, 60);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(photo5, photo5.width/2, photo5.height/2);
  popMatrix();
   
image(opentemplate ,320,240);

}
 
void mousePressed ()
{
  redraw();
  background(255);
}


//import com.aetrion.flickr.*;
//import processing.core.*;
//import org.xml.sax.SAXException;
//import com.aetrion.flickr.contacts.*;
//import com.aetrion.flickr.people.*;
//import com.aetrion.flickr.FlickrException;
//
//String apiKey = "####";
//Flickr f;
//ContactsInterface c;
//PeopleInterface p;
//
//void setup() {
//  size(1360, 768);
//  background(255);
//  
//  f = new Flickr(apiKey);
//  c = f.getContactsInterface();
//  p = f.getPeopleInterface();
//  User u;
//  
//  try {
//    u = p.findByUsername("scoprire");
//    Collection co = c.getPublicList(u.getId());
//    Iterator it = co.iterator();
//    
//    while(it.hasNext()) {
//    Contact contact = (Contact) it.next();
//    println(contact.getUsername());  
//    }
//  } catch (IOException e) {
//    e.printStackTrace();
//  } catch (SAXException e) {
//    e.printStackTrace();
//  } catch (FlickrException e) {
//    e.printStackTrace();
//  }
//}
//
//void draw() {
//} 


