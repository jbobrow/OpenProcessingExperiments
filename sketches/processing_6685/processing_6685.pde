
final static float[][] MATRIX = { { 1, 1, -1, -1 }, { -1, 1, 1, -1 } };

Texture face;
Texture metal;

class Gear
{
  private int num;
  private float radius, rot;
  private FloatBuffer vbufferA, vbufferB, tbufferA, tbufferB, tbufferX;

  public Gear(int num, float radius)
  {
    this.num = num;
    this.radius = radius;
    this.rot = 0;
    this.vbufferA = BufferUtil.newFloatBuffer((num * 8 + 2) * 3);
    this.vbufferB = BufferUtil.newFloatBuffer((num * 4 + 0) * 3);
    this.tbufferA = BufferUtil.newFloatBuffer((num * 8 + 0) * 2);
    this.tbufferB = BufferUtil.newFloatBuffer((num * 2 + 0) * 2);
    this.tbufferX = BufferUtil.newFloatBuffer((num * 8 + 2) * 2);
    float w = HALF_PI * radius / num; // half of the width of a gear tooth
    float z = sqrt(radius);           // half of the depth of the gear
    PMatrix matrix = new PMatrix3D();
    for(int i = 0; i < num; i++)
    {
      matrix.rotateZ(TWO_PI / num);
      for(int j = 0; j < 4; j++)
      {
        PVector p = matrix.mult(new PVector(MATRIX[0][j] * w, MATRIX[1][j] * w + radius, 0), new PVector(0, 0, 0));
        vbufferA.put(p.x); vbufferA.put(p.y); vbufferA.put(+z);
        vbufferA.put(p.x); vbufferA.put(p.y); vbufferA.put(-z);
        tbufferA.put(0.5 + p.x / radius / 2.3);
        tbufferA.put(0.5 + p.y / radius / 2.3);
        tbufferX.put((j + 0) % 2); tbufferX.put(1);
        tbufferX.put((j + 1) % 2); tbufferX.put(0);
        if(j == 0 || j == 3)
        {
          vbufferB.put(p.x); vbufferB.put(p.y); vbufferB.put(+z);
          vbufferB.put(p.x); vbufferB.put(p.y); vbufferB.put(-z);
          tbufferB.put(0.5 + p.x / radius / 2.3);
          tbufferB.put(0.5 + p.y / radius / 2.3);
        }
      }
    }
    for(int i = 0; i < 6; i++) vbufferA.put(vbufferA.get(i)); // close the circle
    for(int i = 0; i < 4; i++) tbufferX.put(tbufferX.get(i)); // close the circle
    vbufferA.rewind();
    vbufferB.rewind();
    tbufferA.rewind();
    tbufferB.rewind();
    tbufferX.rewind();
    if(metal == null) metal = new Texture(loadImage("metal.png"));
    if(face  == null) face  = new Texture(loadImage("face.png"));
  }

  public void draw(float value)
  {
    pushMatrix();

    rotateZ(rot += value);

    // initialize OpenGL
    pgl.beginGL();
    gl.glEnable(GL.GL_TEXTURE_2D);
    gl.glEnableClientState(GL.GL_VERTEX_ARRAY);
    gl.glEnableClientState(GL.GL_TEXTURE_COORD_ARRAY);

    // draw thickness of gear
    gl.glBindTexture(GL.GL_TEXTURE_2D, metal.id);
    gl.glVertexPointer(3, GL.GL_FLOAT, 0, vbufferA);
    gl.glTexCoordPointer(2, GL.GL_FLOAT, 0, tbufferX);
    gl.glDrawArrays(GL.GL_QUAD_STRIP, 0, num * 8 + 2);

    // draw the front of each tooth
    gl.glBindTexture(GL.GL_TEXTURE_2D, face.id);
    gl.glVertexPointer(3, GL.GL_FLOAT, 24, vbufferA);
    gl.glTexCoordPointer(2, GL.GL_FLOAT, 0, tbufferA);
    gl.glDrawArrays(GL.GL_QUADS, 0, num * 4 + 0);

    // draw the back of each tooth
    vbufferA.position(3);
    gl.glVertexPointer(3, GL.GL_FLOAT, 24, vbufferA);
    gl.glTexCoordPointer(2, GL.GL_FLOAT, 0, tbufferA);
    gl.glDrawArrays(GL.GL_QUADS, 0, num * 4 + 0);
    vbufferA.rewind();

    // draw the front face of the gear
    gl.glVertexPointer(3, GL.GL_FLOAT, 24, vbufferB);
    gl.glTexCoordPointer(2, GL.GL_FLOAT, 0, tbufferB);
    gl.glDrawArrays(GL.GL_POLYGON, 0, num * 2);

    // draw the back face of the gear
    vbufferB.position(3);
    gl.glVertexPointer(3, GL.GL_FLOAT, 24, vbufferB);
    gl.glTexCoordPointer(2, GL.GL_FLOAT, 0, tbufferB);
    gl.glDrawArrays(GL.GL_POLYGON, 0, num * 2);
    vbufferB.rewind();

    // clean up
    gl.glDisable(GL.GL_TEXTURE_2D);
    gl.glDisableClientState(GL.GL_VERTEX_ARRAY);
    gl.glDisableClientState(GL.GL_TEXTURE_COORD_ARRAY);
    pgl.endGL();

    popMatrix();
  }
}


