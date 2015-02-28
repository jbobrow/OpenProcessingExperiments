
void mouseClicked() {
  if (keyPressed) {
    switch(key) {
     case ' ':
      for (int i=0;i<members.size();i++) {
        Member m=(Member)members.get(i);
        if (m.iFrame.grabsMouse()) {
          fuse.add(m);
          }
      }
      if (fuse.size()==2) {
        Member a=(Member)fuse.get(0);
        Member b=(Member)fuse.get(1);
        physics.addSpring(new VerletConstrainedSpring(a.self, b.self, dist(a.self.x, a.self.y, a.self.z, b.self.x, b.self.y, b.self.z)/2, 0.002));
        fuse.clear();
      }
      break;
    }
  }
  else {
    if (mouseButton==LEFT) {  
      for (int i=0;i<members.size();i++) {
        Member m=(Member)members.get(i);
        if (m.iFrame.grabsMouse()) {
          members.add(new Member(m));
        }
      }
    }
    if (mouseButton==RIGHT) { 
      for (int i=0;i<members.size();i++) {
        Member m=(Member)members.get(i);
        if (m.iFrame.grabsMouse()) {
          m.self.lock();
        }
      }
    }
  }
}

void keyPressed() {
  if (key=='v')buildVolume();  
  if (key=='l')new LaplacianSmooth().filter(mesh, 2);
  if (key=='m')showMesh=!showMesh;
  if (key=='s')mesh.saveAsSTL(sketchPath("relatives.stl"));
    if (key == 'n') {
    for (int i=0;i<members.size();i++) {
      Member m=(Member)members.get(i);
      if (m.iFrame.grabsMouse()) {
        m.grow();
      }
    }
  }
  if (key == 'b') {
    for (int i=0;i<members.size();i++) {
      Member m=(Member)members.get(i);
      if (m.iFrame.grabsMouse()) {
        m.shrink();
      }
    }
  }
  if ( key == 'p' ) {
  saveFrame("relatives/rlt-####.png");
  }
}


