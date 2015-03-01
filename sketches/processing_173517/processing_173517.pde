
String[] ancre1 =
{
  "verde", "rojo", "blanco", "negro", "seco"
};
String[] ancre2 =
{
  "el pasto", "el viento", "el río", "el lago", "el cielo"
};
String[] ancre3 =
{
  "no seco", "no verde", "no rojo", "no blanco", "no negro"
};

PFont f;
float y = 26;

void setup()
{
  size(1024, 768);
  background(255);
  smooth();
  fill(40);
  f = createFont("Arial", 12, true);
  textFont(f, 26);
  textAlign(CENTER);
  text ("verde es el pasto no seco", width/2, height/2);
}

void draw()
{

  if (mousePressed)
  {
    background(255);

    textSize(26);
    text (ancre1[int(random(0, ancre1.length))], width/3*1.03, height/2);

    if (mousePressed) { 
     y += 0.3;

      if (y>=600) {
        y=25;
      }
    }

    textSize(y);
    text ("es", width/3*1.23, height/2);


    textSize(26);
    text (ancre2[int(random(0, ancre2.length))], width/3*1.5, height/2);
    text (ancre3[int(random(0, ancre3.length))], width/3*1.9, height/2);
  }
}

void mousePressed() {
  redraw();
}



