
//void keyPressed()
//{
//  if(key == '1')
//  {
//    hitboxes = !hitboxes;
//  }
//  else if(key == '2')
//  {
//    centers = !centers;
//  }
//  else if(key == '3')
//  {
//    normals = !normals;
//  }
//  else if(key == 'p')
//  {
//    pause = !pause;
//  }
//  else if(key == 'f')
//  {
//    fill = !fill;
//  }
//  else if(key == 'b')
//  {
//    BG = (BG==black) ? beige : black;
//  }
//  else if(key == 't')
//  {
//    showText = !showText;
//  }
//  else if(key == 'c')
//  {
//    colData = !colData;
//  }
//  else if(key == 's')
//  {
//    createType = !createType;
//  }
//  else if(key == 'a')
//  {
//    attract = !attract;
//  }
//  else if(key == '`')
//  {
//    debug = !debug;
//  }
//  else if(key == 'm')
//  {
//    motionData = !motionData;
//  }
//}
//
//void debug()
//{
//  if(mousePressed && mouseButton == RIGHT)
//  {
//    for(Body mov : bodies)
//      mov.attractTo(new Vec2(mouseX, mouseY), (attract) ? 900000 : -1000000);
//  }
//}
//
//void mousePressed()
//{
//  if(!debug) return;
//  if(mousePressed && mouseButton == LEFT)
//  {
//    int n = int(random(3, 8));
//    Vec2[] map = new Vec2[n];
//    float radius = 6 * random(1, 6) + 6;
//    float angle = 0;
//    for(int i = 0; i < n; i++)
//    {
//      map[i] = new Vec2(radius, angle, false);
//      radius = random(1, radius/4) + radius;
//      angle -= TWO_PI/n;
//    }
//    Shape s = (createType) ? new Circle(random(16, 64)) : new Polygon(map);
//    Body additional = new Body(s, mouseX, mouseY, mov);
//    bodies.add(additional);
//  }
//}

