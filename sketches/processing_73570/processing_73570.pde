
//Stephanie Wong ROTATING BOX mods;14-15
//STPrograms.webs.com
void setup()
{
   size(500,500,P3D);
}
void draw()
{
  background(0);
 pointLight(255,255,255,3*mouseX-100,3*mouseY-100,80);
  camera(3*mouseX-100,3*mouseY-100,80,0,0,0,0,1,0);
   fill(7,16,234);
  box(200);
 fill(35,192,247);
  box(100);
    
  fill(35,247,178);
  box(80);
  fill(234,136,7);
  text("Congrats",-25,0,0);
}

