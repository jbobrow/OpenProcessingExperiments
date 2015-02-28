
import processing.net.*;

Server s;
HashMap qv = new HashMap();
void setup()
{
  size(500, 500);
  s = new Server(this, 12345);
}
void serverEvent(Server s, Client c)
{
  qv.put(c.ip(), null);
}
void draw()
{
  fill(100, 20);
  rect(0, 0, width, height);
  Client c = s.available();
  if (c!=null)
  {
    String cs = c.readStringUntil('>');
    if (cs!=null)
    {
      XML cd = XML.parse(cs);
      println(c.ip()+cd);


  String sh = cd.getString("textshape");
      if (sh.equals("rect") ) {
        fill( cd.getInt("r"), cd.getInt("g"), cd.getInt("b") );  
        rect(cd.getInt("x"), cd.getInt("y"), cd.getInt("w"), cd.getInt("h"));
      }
      if (sh.equals("triangle") ) {
        fill( cd.getInt("r"), cd.getInt("g"), cd.getInt("b") );  
        triangle(cd.getInt("x"), cd.getInt("y"), cd.getInt("y"), cd.getInt("w"), cd.getInt("h"),cd.getInt("x"));
      } 
      if (sh.equals("ellipse") ) {
        fill( cd.getInt("r"), cd.getInt("g"), cd.getInt("b") );  
        ellipse( cd.getInt("x"), cd.getInt("y"), cd.getInt("w"), cd.getInt("h"));
      } 
      else {
        text(c.ip(), cd.getInt("x"), cd.getInt("y") );
      }

     text(c.ip(), cd.getInt("x"), cd.getInt("y") );
      c.write("done.");
    }
  }
}



