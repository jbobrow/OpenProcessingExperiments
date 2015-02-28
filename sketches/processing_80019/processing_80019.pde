
import processing.net.*;
color cc = #EA1515;
Client c;
int width= 20;
int height = 20;
XML msg;
void setup()
{
  size(400,400);
frameRate(10);
c = new Client(this, "172.18.45.33", 12345);
msg = new XML("point");
}
void draw()
{
msg.setInt("w",width);
msg.setInt("h",height);
msg.setInt("x",mouseX);
msg.setInt("y",mouseY);
msg.setInt("r",int(red(cc)));
msg.setInt("g",int(green(cc)));
msg.setInt("b",int(blue(cc)));
msg.setString("text","Hello World");
msg.setString("textshape", "rect");
c.write(msg.toString());
}
