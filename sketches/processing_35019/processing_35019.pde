
class BoxObject {

  float x, y, oldX, oldY;
  float PosX, PosY, PosZ, SizeX, SizeY, SizeZ;
  boolean Switcher=false;
  boolean Visibility=true;
  ArrayList<Integer> touchIDs = new ArrayList<Integer>();
  float ScreenPosX1, ScreenPosY1, ScreenPosX2, ScreenPosY2;
  boolean changeColor =false;
  int RedValue = 255;
  int GreenValue = 255;
  int BlueValue = 255;
  color FillColor = color(RedValue, GreenValue, BlueValue);
  float MultZ=0.98;
  boolean saveOffset;



  BoxObject (float x_, float y_, float PosZ_, float SizeX_, float SizeY_, float SizeZ_, color FillColor_) {

    x = x_;
    y = y_;
    PosZ = PosZ_;
    SizeX = SizeX_;
    SizeY = SizeY_;
    SizeZ = SizeZ_;

    FillColor = FillColor_;
  }

  void draw() {
    if (Visibility) {
      pushMatrix();
      translate(x, y, PosZ);
      //      Styler();
      CalculateScreenPos();
      Drawer();
      popMatrix();
      //      drawEl() ;
    }
  }

  void testTouchBegan(Touch t) {
    if (hitTest(t.getX(), t.getY())) {
      touchIDs.add(new Integer(t.id));
      // println("b " + t.id);
      getOldPositions();
      Switcher =  !Switcher;
    } 
  }

  void testTouchEnded(Touch t) {
    for (int i = 0; i<touchIDs.size();i++) {
      if (touchIDs.get(i).intValue()==t.id) {
        //  println("e " + touchIDs.get(i).intValue());
        touchIDs.remove(i);
        changeColor = !changeColor;
        getOldPositions();
      }
    }
  }
  void testTouchMoved(double[] tt, Touch t) {
    for (int i =0; i<touchIDs.size();i++) {
      if (touchIDs.get(i).intValue()==t.id) {
        //        println("m " + touchIDs.get(i).intValue());
        x=(float) tt[0];
        y=(float) tt[1];
        PosZ= (float) tt[2];

        //changeColor = false;
      }
    }
  }

  float[] getTouch3D(Touch t)
  {
    ((PGraphicsOpenGL)g).beginGL();
    int viewport[] = new int[4];
    double[] proj=new double[16];
    double[] model=new double[16];
    gl.glGetIntegerv(GL.GL_VIEWPORT, viewport, 0);
    gl.glGetDoublev(GL.GL_PROJECTION_MATRIX, proj, 0);
    gl.glGetDoublev(GL.GL_MODELVIEW_MATRIX, model, 0);
    // FloatBuffer fb=ByteBuffer.allocateDirect(4).order(ByteOrder.nativeOrder()).asFloatBuffer();
    // int start = millis();
    //    gl.glReadPixels((int) t.x, (int) (height-t.y), 1, 1, GL.GL_DEPTH_COMPONENT, GL.GL_FLOAT, fb);
    // println(millis()-start);
    //fb.rewind();
    double[] mousePosArr=new double[4];
    glu.gluUnProject((double)t.getX(), height-(double)t.getY(), /*(double)fb.get(0)*/MultZ, model, 0, proj, 0, viewport, 0, mousePosArr, 0);
    ((PGraphicsOpenGL)g).endGL();
    testTouchMoved(mousePosArr, t);
    //println(MultZ);

    return new float[] {
      (float)mousePosArr[0], (float)mousePosArr[1], (float)mousePosArr[2]
    };
  }

  void getOldPositions() {
    pushMatrix();
    if ((screenX(0, 0, 0)<width/2)&&(screenY(0, 0, 0)<height/2)) {
      oldX= ScreenPosX2; //screenX(+SizeX/2, +SizeY/2, -SizeZ/2);
      oldY=ScreenPosY2;// screenY(+SizeX/2, +SizeY/2, -SizeZ/2);
    } 
    else if ( (screenX(0, 0, 0)>width/2)&&(screenY(0, 0, 0)<height/2)) {
      oldX=ScreenPosX2; //screenX(x, y, PosZ)+ screenX(+SizeX/2, -SizeY/2, +SizeZ/2);
      oldY=ScreenPosY2; // screenY(x, y, PosZ)+ screenY(-SizeX/2, +SizeY/2, -SizeZ/2);
    } 
    else if ( (screenX(0, 0, 0)<width/2)&&(screenY(0, 0, 0)>height/2)) {
      oldX=ScreenPosX2; //screenX(x, y, PosZ)+ screenX(+SizeX/2, -SizeY/2, -SizeZ/2);
      oldY=ScreenPosY2; // screenY(x, y, PosZ)+ screenY(-SizeX/2, +SizeY/2, +SizeZ/2);
    } 
    else if ( (screenX(0, 0, 0)>width/2)&&(screenY(0, 0, 0)>height/2)) {
      oldX=ScreenPosX2; //screenX(x, y, PosZ)+ screenX(+SizeX/2, +SizeY/2, +SizeZ/2);
      oldY=ScreenPosY2; //screenY(x, y, PosZ)+ screenY(+SizeX/2, +SizeY/2, +SizeZ/2);
    }
    popMatrix();
  }

  void CalculateScreenPos() {
    if ((screenX(0, 0, 0)<width/2)&&(screenY(0, 0, 0)<height/2)) {
      ScreenPosX1 = screenX(-SizeX/2, -SizeY/2, +SizeZ/2);
      ScreenPosX2 = screenX(+SizeX/2, +SizeY/2, -SizeZ/2);
      ScreenPosY1 = screenY(-SizeX/2, -SizeY/2, +SizeZ/2);
      ScreenPosY2 = screenY(+SizeX/2, +SizeY/2, -SizeZ/2);
    } 
    else if ( (screenX(0, 0, 0)>width/2)&&(screenY(0, 0, 0)<height/2)) {
      ScreenPosX2 = screenX(+SizeX/2, -SizeY/2, +SizeZ/2);
      ScreenPosX1 = screenX(-SizeX/2, +SizeY/2, -SizeZ/2);
      ScreenPosY2 = screenY(-SizeX/2, +SizeY/2, -SizeZ/2);
      ScreenPosY1 = screenY(+SizeX/2, -SizeY/2, +SizeZ/2);
    } 
    else if ( (screenX(0, 0, 0)<width/2)&&(screenY(0, 0, 0)>height/2)) {
      ScreenPosX2 = screenX(+SizeX/2, -SizeY/2, -SizeZ/2);
      ScreenPosX1 = screenX(-SizeX/2, +SizeY/2, +SizeZ/2);
      ScreenPosY2 = screenY(-SizeX/2, +SizeY/2, +SizeZ/2);
      ScreenPosY1 = screenY(+SizeX/2, -SizeY/2, -SizeZ/2);
    } 
    else if ( (screenX(0, 0, 0)>width/2)&&(screenY(0, 0, 0)>height/2)) {
      ScreenPosX1 = screenX(-SizeX/2, -SizeY/2, -SizeZ/2);
      ScreenPosX2 = screenX(+SizeX/2, +SizeY/2, +SizeZ/2);
      ScreenPosY1 = screenY(-SizeX/2, -SizeY/2, -SizeZ/2);
      ScreenPosY2 = screenY(+SizeX/2, +SizeY/2, +SizeZ/2);
    }
    //   println ( " MouseX " + mouseX+ " MouseY " + mouseY +" X1 " +ScreenPosX1+ " X2 " +ScreenPosX2+ " Y1 " +ScreenPosY1+ " Y2 " + ScreenPosY2 );
  }

  void Drawer() {
    fill(RedValue, GreenValue, BlueValue);
    box(SizeX, SizeY, SizeZ);
  }

  //  void drawEl() {
  //    ellipse(ScreenPosX2, ScreenPosY2, 50, 50);
  //  }



  boolean hitTest(float x_, float y_) {

    boolean XRange;
    boolean YRange;

    //Test if MouseX's X-Values are in the X-Range of the Cube-Rectangle
    if ( (x_>(+ScreenPosX1)) && ( x_<(+ScreenPosX2) ) ) {
      XRange = true;
    }
    else {
      XRange = false;
    }

    if ( (y_>(+ScreenPosY1)) && (y_<(+ScreenPosY2))) {
      YRange = true;
    }
    else {
      YRange = false;
    }



    if (XRange && YRange) {
      //   println( " hit ");
      return true;
    }
    else {
      // println( " no hit ");
      return false;
    }
  }
}


