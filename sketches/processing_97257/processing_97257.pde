
import java.applet.Applet;
import java.awt.*;
import java.awt.event.*;
import java.util.GregorianCalendar; 
import java.util.Date;


private Choice giorno, mese, anno;
private int a,b,c; 
private int a1, b1,c1, sett; 



GregorianCalendar oggi = new GregorianCalendar();

void setup() {
  textSize(12);
  size(400, 500);
//  background(150,150,150);
  noStroke();
  fill(102);
zella(); 
}


void draw() {
background(200);

giorno.setLocation(120,1);
mese.setLocation(170,1);
anno.setLocation(220,1);

text("Giorno",125,40);
text("Mese",175,40);
text("Anno",225,40);

Date today = new Date();

   a1 = Integer.parseInt(giorno.getSelectedItem());
   b1 = Integer.parseInt(mese.getSelectedItem());
   c1 = Integer.parseInt(anno.getSelectedItem());
   Date d1 = new GregorianCalendar(c1, b1, a1).getTime();

  long diff = (today.getTime() - d1.getTime());
  long d = int(diff / 86400000)+30; 
  text("Giorni Trascorsi :  "+d,10,120);
  text("Anni Trascorsi   :  "+d/365,10,150);

}


void zella()
{
    giorno = new Choice();  

    for (a=1; a<32; a++)
    {
    giorno.addItem(""+a);
    }
    mese = new Choice();
    for (b=1; b<13; b++)
    {
    mese.addItem(""+b);
    }
    
    anno = new Choice();
    for (c=1950; c<2050; c++)
    {
    anno.addItem(""+c);
    } 
    
    giorno.addItemListener(null);
    mese.addItemListener(null);
    anno.addItemListener(null);
 
    add(giorno);
    add(mese);
    add(anno);
 }
 
 

