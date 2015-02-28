
void draw()
{
  physics.tick(0.25);
  background(0);

  // Draw rope
  stroke(100, 100, 255);
  noFill();
  beginShape();
  for(int i = 1; i < physics.numberOfParticles(); i++)
  {
    Vector3D p = physics.getParticle(i).position();
    curveVertex(p.x(), p.y(), p.z());
    if(i == 1 || i == physics.numberOfParticles() - 1) curveVertex(p.x(), p.y(), p.z());
  }
  endShape();

  // Center box
  stroke(255, 0, 0);
  fill(150, 0, 0, 150);
  box(250);

  // Draw heads up display
  cam.beginHUD();
  fill(255);
  text(nf(frameRate, 2, 2) + " FPS", 4, 17);
  text((physics.numberOfParticles() - 1) + " Particles", 4, height - 5);
  cam.endHUD();
}


