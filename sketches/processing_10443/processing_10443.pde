
void draw()
{
  if(!paused) physics.tick(T);
  background(0);

  // Draw bounding box
  stroke(255, 0, 0, 155);
  noFill();
  box(2 * box_radius);

  // Draw springs
  stroke(100, 100, 255);
  for(int i = physics.numberOfSprings() - 1; i > -1; i--)
  {
    Spring spring = physics.getSpring(i);
    Vector3D p1 = spring.getOneEnd().position();
    Vector3D p2 = spring.getTheOtherEnd().position();
    line(p1.x(), p1.y(), p1.z(), p2.x(), p2.y(), p2.z());
    if(p1.distanceTo(p2) > D)
    {
      physics.removeSpring(i);
      connected[lookupParticle(spring.getOneEnd())][lookupParticle(spring.getTheOtherEnd())] = false;
    }
  }

  // Draw particles
  noStroke();
  for(int i = 0; i < physics.numberOfParticles(); i++)
  {
    Particle particle = physics.getParticle(i);
    Vector3D position = particle.position();
    if(!paused)
    {
      float d = H / (1 - pow(random(1), 4));
      position.add(random(-d, d), random(-d, d), random(-d, d));
    }
    if(position.x() > +box_radius) { position.setX(2 * +box_radius - position.x()); particle.velocity().setX(-particle.velocity().x()); }
    if(position.x() < -box_radius) { position.setX(2 * -box_radius - position.x()); particle.velocity().setX(-particle.velocity().x()); }
    if(position.y() > +box_radius) { position.setY(2 * +box_radius - position.y()); particle.velocity().setY(-particle.velocity().y()); }
    if(position.y() < -box_radius) { position.setY(2 * -box_radius - position.y()); particle.velocity().setY(-particle.velocity().y()); }
    if(position.z() > +box_radius) { position.setZ(2 * +box_radius - position.z()); particle.velocity().setZ(-particle.velocity().z()); }
    if(position.z() < -box_radius) { position.setZ(2 * -box_radius - position.z()); particle.velocity().setZ(-particle.velocity().z()); }
    if(particle.velocity().length() > C) particle.velocity().multiplyBy(C / particle.velocity().length());
    for(int j = i + 1; j < physics.numberOfParticles(); j++)
    {
      Particle p = physics.getParticle(j);
      if(connected[i][j]) continue;
      if(position.distanceTo(p.position()) < W)
      {
        physics.makeSpring(particle, p, S[0], S[1], S[2]);
        connected[i][j] = true;
      }
    }
    if(particle.mass() == 1.0) fill(155, 255, 155, 155);
    else                       fill(155, 155, 255, 155);
    pushMatrix();
    translate(position.x(), position.y(), position.z());
    box(W);
    popMatrix();
  }

  // Draw heads up display
  cam.beginHUD();
  fill(255);
  text(round(frameRate) + " FPS",                4, 17);
  text(help ? helpText : "Type 'H' for help...", 4, 37);
  text("Drag: "       + drag,                        4, height - 45);
  text("Box Radius: " + round(box_radius),           4, height - 25);
  text("Particles: "  + physics.numberOfParticles(), 4, height -  5);
  cam.endHUD();
}

int lookupParticle(Particle p)
{
  for(int i = 0; i < physics.numberOfParticles(); i++)
  {
    if(physics.getParticle(i) == p) return i;
  }
  return -1;
}

