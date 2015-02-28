

void renderer(World world) {
  // clear the background
   background(213,222,217);
   if(game_mode == 0){
      image(title,width/2-160 , height/2-80);
      fill(122,106,83);
      text("See how long you can balance the large boulder. Use your mouse to move the small boulder.", 160, height/2);
      text("Don't let the the larger boulder hit the walls or ground.",260,height/2+15);   
      text("Click to start.",width/2-30,height/2+40);    
} else {
  // iterate through the bodies
  Body body;
  for (body = world.getBodyList(); body != null; body = body.getNext()) {
 
    // iterate through the shapes of the body
    org.jbox2d.collision.Shape shape;
    for (shape = body.getShapeList(); shape != null; shape = shape.getNext()) {
 
      // find out the shape type
      ShapeType st = shape.getType();
      if (st == ShapeType.POLYGON_SHAPE) {
 
        // polygon? let's iterate through its vertices while using begin/endShape()
        beginShape();
        PolygonShape poly = (PolygonShape) shape;
        int count = poly.getVertexCount();
        Vec2[] verts = poly.getVertices();
        
        if(body == ground){
          //ground style
          noStroke();
          stroke(255,50);
          fill(122,106,83);
        } else {
          //wall style
          fill(122,106,83);
          noStroke();
          stroke(255,50);
        }
        
        for(int i = 0; i < count; i++) {
          Vec2 vert = physics.worldToScreen(body.getWorldPoint(verts[i]));
          vertex(vert.x, vert.y);
        }
        Vec2 firstVert = physics.worldToScreen(body.getWorldPoint(verts[0]));
        vertex(firstVert.x, firstVert.y);
        endShape();
 
      } else if (st == ShapeType.CIRCLE_SHAPE) {
 
        // circle? let's find its center and radius and draw an ellipse
        CircleShape circle = (CircleShape) shape;
        Vec2 pos = physics.worldToScreen(body.getWorldPoint(circle.getLocalPosition()));
        float radius = physics.worldToScreen(circle.getRadius());
        ellipseMode(CENTER);
        if(body == lilBall){
          
          //little ball style
          stroke(122,106,83);
          fill(217,206,178);
          
        } else{
          
          //balanced ball style
          stroke(122,106,83);
          fill(148,140,117);
          
        }
        ellipse(pos.x, pos.y, radius*2, radius*2);
        // we'll add one more line to see how it rotates
        
        //line(pos.x, pos.y, pos.x + radius*cos(-body.getAngle()), pos.y + radius*sin(-body.getAngle()));
        ellipse(pos.x + .5 * radius*cos(-body.getAngle()),pos.y + .5 * radius*sin(-body.getAngle()), 20,20);
 
      }
    }
  }
  displayUI();
}
}

