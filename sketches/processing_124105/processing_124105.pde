
PImage img; // Bilder müssen global gesetzt werden, um für alles zu gelten 
            // am besten in 72 dpi und natürlich RGB
            // Verhält sich wie rect kann aber auf Center gesetzt werden
PImage img2;

void setup()
{
  size(1000,500);
  img = loadImage("Levis.png");
  img2 = loadImage("turbostaat.png");
}

void draw()
{
  background(255);
  imageMode(CENTER);
  tint(255,153,204); // vor Bild, das eingefärbt werden soll, danach noTint()
  image(img, 0, 0); // am besten hier keine Größe, um das Bild nicht zu stauchen
  
   
imageMode(CENTER);
tint(255,mouseX/2); //weiße Färbung beteutet nur Transparenz
image(img2,mouseX,mouseY,150,150);
}


// filter werden auf alles gezogen... nicht nur auf eine Ebene


