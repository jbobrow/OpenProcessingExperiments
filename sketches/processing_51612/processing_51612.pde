
PGraphics ojo;
PGraphics campo;

void setup() {
  size(700, 400);
  ojo = createGraphics(width, height, P3D);
  ojo.beginDraw();
  ojo.endDraw();
  campo = createGraphics(width, height, P3D);
  campo.beginDraw();
  campo.endDraw();
}

void mousePressed() {
}

void draw() {  
  ojo.beginDraw();
  ojo.noStroke();
  ojo.fill(lerpColor(color(#D8FF00), color(#CBA523), .5+.5*cos(frameCount/200.)), 120);
  ojo.hint(DISABLE_DEPTH_TEST);
  ojo.rect(0, 0, width, height);
  ojo.hint(ENABLE_DEPTH_TEST);
  ojo.fill(#CE0C8B);
  ojo.lights();
  ojo.translate(width/2, -500, -2000);
  if (frameCount%30<3) {
    ojo.scale(3-(frameCount%30)+1);
  }
  ojo.sphere(500);
  for (int i=0; i<4; i++) {
    ojo.pushMatrix();
    ojo.rotateX(radians(frameCount));
    ojo.rotateY(radians(frameCount*i));
    ojo.rotateZ(radians(frameCount*i*i));
    ojo.translate(i*150, 300-i*50);
    ojo.sphere(300-i*35);
    ojo.popMatrix();
  }
  ojo.endDraw();
  ojo.filter(POSTERIZE, 3);

  campo.beginDraw();
  campo.lights();
  campo.directionalLight(255, 255, 255, cos(frameCount/6.), 0, sin(frameCount/6.));
  campo.background(0);
  campo.pushMatrix();
  campo.translate(width/2, height, 0);
  for (int z=0; z<15; z++) {
    campo.fill(255-z*255/15.);
    campo.translate(0, 0, -100);
    for (int i=0; i<1000; i++) {
      campo.pushMatrix();
      campo.translate(100*i, 0, 0);
      if (campo.screenX(0, 0, 0)>width*1.1) {
        campo.popMatrix();
        break;
      }
      float salto = -noise(i, z+frameCount*.06)*40*z;
      campo.translate(0, salto, 0);
      campo.box(90);
      campo.translate(-200*i, 0, 0);
      campo.box(90);
      campo.popMatrix();
    }
  }
  campo.popMatrix();
  if (mousePressed) {
    campo.fill(#3B9DFC);
    campo.noStroke();
    campo.translate(mouseX, 0, 0);
    campo.rotateY(HALF_PI);
    campo.rect(0, -height*2, width*1000, height*5);
    campo.stroke(0);
  }
  campo.endDraw();
  campo.mask(campo);

  background(ojo);
  image(campo, 0, 0);
}


