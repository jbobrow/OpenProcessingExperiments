
import java.util.Vector;
import java.util.LinkedList;
import java.util.Random;
import java.util.concurrent.atomic.AtomicIntegerArray;
import java.awt.*;
import java.io.*;
import processing.core.PMatrix;


final int lightSourceSamples = 1;
final int cacheSamples = 80;
int g_ShowTiles = 0;  // 0 or 1
final boolean g_UseCache = false;
final boolean g_EnableDeepCache = false;

int g_Profile = 0;  // set to 1
int g_IntersectTime = 0;
int g_FrameTime = 0;
int g_CopyTime = 0;
int g_DiffuseTime = 0;
int g_ReflectTime = 0;
int g_DirectTime = 0;
int g_TriAccelTime = 0;
int g_SkyTime = 0;
int g_MaxBounces = 2;
//int g_CacheHit = 0;
//int g_CacheMiss = 0;

boolean g_UseIBL = false;
boolean g_UseReflection = false;
boolean g_UseRefraction = false;
boolean g_PrintStats = true;
boolean g_PrintHelp = false;
boolean g_ShowNormals = true;

WorkQueue g_Workers;
final int g_FrameWidth = 384;
final int g_FrameHeight = 384;
int g_AccFrameCount = 0;
PImage g_FrameBuffer;
float[] g_Picture;
bvhNode[] g_DeepestNodes;
Scene g_Scene;

final int g_TilesAcross = g_Profile == 1 ? 1 : 4;  // 4x4
final int g_TileWidth = g_FrameWidth / g_TilesAcross;
final int g_TileHeight = g_FrameHeight / g_TilesAcross;

final PVector _black = new PVector(0,0,0);

Random rand = new Random();

irradianceCache g_IrradianceCache = new irradianceCache();

// 3D irradiance map
class irradianceCache
{
    final int mSize = 1024*1024;
    final int mSizeMask = mSize - 1;
    int mCount = 0;
    
    AtomicIntegerArray mHashes;
    float[]    mValues;

    float mSceneScale = 0;
    
    void setSceneSize(float size)
    {
        mSceneScale = 250.0f / size;  // 150
    }
    
    irradianceCache()
    {
      mValues = new float[mSize * 4];  // Color.rgb, count
      mHashes = new AtomicIntegerArray(mSize);
      
      _flush();
    }
    
    int _get(int k, PVector col)
    {
      float count = mValues[k * 4 + 3];
      float c = (count <= 1) ? 1.0f : 1.0f / count;
      col.x = mValues[k * 4] * c;
      col.y = mValues[k * 4 + 1] * c;
      col.z = mValues[k * 4 + 2] * c;
      return (int)count;
    }
    
    void _add(int k, PVector col)
    {
      mValues[k * 4] += col.x;
      mValues[k * 4 + 1] += col.y;
      mValues[k * 4 + 2] += col.z;
      mValues[k * 4 + 3] += 1.0f;
    }
    
    int getSampleCount(int key)
    {
      return (int)mValues[key * 4 + 3];
    }

    void _flush()
    {
      for (int i = 0; i < mHashes.length(); i++)
        mHashes.set(i, 0xffffffff);

      mCount = 0;
    }
    
    int keyFromHash(int hash)
    {
        for (int i = 0; i < 32; i++)
        {
            int key = (hash + i) & mSizeMask;  // key is just an array index.
            
            if (mHashes.get(key) == hash)
              return key;  // cache hit
            
            if (mHashes.compareAndSet(key, 0xffffffff, hash))  // Claim
            {
              // Reset estimate
              mValues[key * 4] = 0;
              mValues[key * 4 + 1] = 0;
              mValues[key * 4 + 2] = 0;
              mValues[key * 4 + 3] = 0;
//              mCount++;
              return key;
            }
        }
//        println("hash fail");
        return -1;
    }

    int makeKey(PVector v)
    {
      // http://stackoverflow.com/questions/5928725/hashing-2d-3d-and-nd-vectors
      int x = (int)(v.x * mSceneScale);
      int y = (int)(v.y * mSceneScale);
      int z = (int)(v.z * mSceneScale);
      x *= 73856093;
      y *= 19349663;
      z *= 83492791;
      int hash = x+y+z;
      int key = keyFromHash(hash);
      return key;
    }
}


class Camera
{
  PVector      mPivot;
  float        mAngleX;
  float        mAngleY;
  float        mZoom;
  float        mSideStep;
  float        mUpDown;

  PMatrix3D    mRotation;
  PVector      mPosition;

  float        mHFOV = (float)Math.toRadians(45.0f);
  float        mVFOV = (float)Math.toRadians(45.0f);
  float        mD = 1.0f;  // Front plane

  float        mHalfW;
  float        mHalfH;

  Camera(PVector pivot, float zoom)
  {
    mPivot = pivot;
    mPosition = new PVector();
    mRotation = new PMatrix3D();

    mAngleX = 0.0f;
    mAngleY = 0.0f;
    mZoom = zoom;
    mSideStep = 0.0f;
    mUpDown = 0.0f;

    _update();
  }

  void _mul3x3(PMatrix3D m1, PMatrix3D m2)
  {
    float new00 = m1.m00 * m2.m00 + m1.m01 * m2.m10 + m1.m02 * m2.m20;
    float new01 = m1.m00 * m2.m01 + m1.m01 * m2.m11 + m1.m02 * m2.m21;
    float new02 = m1.m00 * m2.m02 + m1.m01 * m2.m12 + m1.m02 * m2.m22;

    float new10 = m1.m10 * m2.m00 + m1.m11 * m2.m10 + m1.m12 * m2.m20;
    float new11 = m1.m10 * m2.m01 + m1.m11 * m2.m11 + m1.m12 * m2.m21;
    float new12 = m1.m10 * m2.m02 + m1.m11 * m2.m12 + m1.m12 * m2.m22;

    float new20 = m1.m20 * m2.m00 + m1.m21 * m2.m10 + m1.m22 * m2.m20;
    float new21 = m1.m20 * m2.m01 + m1.m21 * m2.m11 + m1.m22 * m2.m21;
    float new22 = m1.m20 * m2.m02 + m1.m21 * m2.m12 + m1.m22 * m2.m22;

    m2.m00 = new00;
    m2.m01 = new01;
    m2.m02 = new02;

    m2.m10 = new10;
    m2.m11 = new11;
    m2.m12 = new12;

    m2.m20 = new20;
    m2.m21 = new21;
    m2.m22 = new22;
  }

  void _mul3x3(PMatrix3D m, PVector v)
  {
    float newx = v.x * m.m00 + v.y * m.m10 + v.z * m.m20;
    float newy = v.x * m.m01 + v.y * m.m11 + v.z * m.m21;
    float newz = v.x * m.m02 + v.y * m.m12 + v.z * m.m22;
    v.x = newx;
    v.y = newy;
    v.z = newz;
  }

  void _update()
  {
    mPosition.set( mPivot );

    float sinx = sin(mAngleX);
    float cosx = cos(mAngleX);
    float siny = sin(mAngleY);
    float cosy = cos(mAngleY);

    PMatrix3D rotX = new PMatrix3D();
    rotX.set(1, 0, 0, 0, 0, cosx, -sinx, 0, 0, sinx, cosx, 0, 0, 0, 0, 1);

    PMatrix3D rotY = new PMatrix3D();
    rotY.set(cosy, 0, siny, 0, 0, 1, 0, 0, -siny, 0, cosy, 0, 0, 0, 0, 1);

    PVector fwd = new PVector(0, 0, 1);

    _mul3x3(rotX, rotY);
    _mul3x3(rotY, fwd);

    PVector up = new PVector(0, 1, 0);
    PVector right = up.cross(fwd);
    up = fwd.cross(right);

    right.normalize();
    up.normalize();

    mRotation.set(
    right.x, right.y, right.z, 0, 
    up.x, up.y, up.z, 0, 
    fwd.x, fwd.y, fwd.z, 0, 
    0, 0, 0, 1);

    mPosition.add( PVector.mult(fwd, mZoom) );
    mPosition.add( PVector.mult(right, mSideStep) );
    mPosition.add( PVector.mult(up, mUpDown) );

    mHalfW = (float)Math.tan(mVFOV * 0.5f) * mD;
    mHalfH = (float)Math.tan(mHFOV * 0.5f) * mD;
  }

  Ray _generateRay(float u, float v)
  {
    float x = -mHalfW + (u * mHalfW * 2.0f);
    float y = mHalfH - (v * mHalfH * 2.0f);  // v is upside down.

    PVector dir = new PVector(x, y, mD);
    _mul3x3(mRotation, dir);
    dir.normalize();

    Ray ray = new Ray();
    ray._init(mPosition, dir, dir, 0);
    return ray;
  }

  void _rotate(float dx, float dy)
  {
    g_Restart = true;
    
    mAngleX += -dy * 3.0f;
    mAngleY += -dx * 3.0f;
    mAngleX = Math.max((float)-Math.PI * 0.499f, mAngleX);
    mAngleX = Math.min((float)Math.PI * 0.499f, mAngleX);
    _update();
  }

  void _zoom(float dz, float sceneSize)
  {
    g_Restart = true;
  
    mZoom -= dz * sceneSize;
    _update();
  }

  void _translate(float dx, float dy, float sceneSize)
  {
    g_Restart = true;
    
    mSideStep += -dx * sceneSize;
    mUpDown += dy * sceneSize;
    _update();
  }
}


class Ray
{
  PVector    mOrigin;
  PVector    mDir;
  PVector    mInvDir;
  float      mMinT;
  float      mMaxT;  // Modified via intersect()

  void _init(PVector origin, PVector normal, PVector dir, float bias) 
  {
    mOrigin = new PVector();  // Not sure.    
    mOrigin = origin;
    mOrigin.add( PVector.mult( normal, bias ) );

    mDir = new PVector();    
    mDir = dir;

    mInvDir = new PVector();
    mInvDir.x = mDir.x == 0.0f ? 100000.0f : 1.0f / mDir.x;
    mInvDir.y = mDir.y == 0.0f ? 100000.0f : 1.0f / mDir.y;
    mInvDir.z = mDir.z == 0.0f ? 100000.0f : 1.0f / mDir.z;

    mMinT = 0.0001f;
    mMaxT = 100000.0f;  // Modified via intersect()
  }
}

class Quad
{
  tri[]     mTris;

  void _init(PVector a, PVector b, PVector c, PVector d, PVector normal)
  {
    mTris = new tri[2];
    mTris[0] = new tri();
    mTris[1] = new tri();
    mTris[0].initt(a, b, c, normal, normal, normal);
    mTris[1].initt(a, c, d, normal, normal, normal);
  }
/*  
  void move(float dx, float dy, float dz)
  {
    for (int i = 0; i < 2; i++)
      for (int j = 0; j < 3; j++)
        mTris[i].move(dx,dy,dz,j);
  }

  void resize(float dx)
  {
    PVector a = mTris[0].mVertices[0];
    PVector c = mTris[1].mVertices[1];
    
    PVector center = PVector.add(a,c);
    center.mult(0.5f);
    
    PVector v = PVector.sub(center, a);
    v.normalize();
    v.mult(dx);

    mTris[0].move(v.x, 0, v.z, 0);
    mTris[0].move(-v.x, 0, v.z, 1);
    mTris[0].move(-v.x, 0, -v.z, 2);
    mTris[1].move(v.x, 0, v.z, 0);
    mTris[1].move(-v.x, 0, -v.z, 1);
    mTris[1].move(v.x, 0, -v.z, 2);
  }
*/

  void _setMaterial(Material mtl)
  {
    mTris[0].setMaterial(mtl);
    mTris[1].setMaterial(mtl);
  }

  hitResult _intersect(Ray ray)
  {
    hitResult hit = new hitResult();

    if (!mTris[0]._intersect(ray, hit))
      mTris[1]._intersect(ray, hit);

    return hit;
  }

  Ray _generateRay(PVector hitPoint, float u, float v, float sceneSize)
  {
    PVector a = mTris[0].mVertices[0];
    PVector b = mTris[0].mVertices[1];
    PVector c = mTris[0].mVertices[2];

    PVector ab = PVector.sub(b, a);
    PVector bc = PVector.sub(c, b);

    PVector posOnMe = new PVector();

    posOnMe.set( a );
    posOnMe.add( PVector.mult(ab, u) );
    posOnMe.add( PVector.mult(bc, v) );

    PVector toMe = PVector.sub(posOnMe, hitPoint);
    toMe.normalize();

    Ray ray = new Ray();
    ray._init(hitPoint, toMe, toMe, 0.001f * sceneSize);
    return ray;
  }
}

class RayTracerTile implements Runnable
{
  int       mTileX;
  int       mTileY;

  Scene     mScene;
  int       mTileWidth, mTileHeight;
  float     mJitterX, mJitterY;
  

  public void run()
  {
    //        println("    RayTracerTile (" + mTileX + ", " + mTileY + ") is running");

    final int top = mTileY * mTileHeight;
    final int left = mTileX * mTileWidth;

    final float baseu = float(mTileX) / float(g_TilesAcross);
    final float basev = float(mTileY) / float(g_TilesAcross);

    float du = 1.0 / float(mTileWidth - 1);
    du /= float(g_TilesAcross);

    float dv = 1.0 / float(mTileHeight - 1);
    dv /= float(g_TilesAcross);

    for (int y = 0; y < mTileHeight - g_ShowTiles; y++)
    {
      float v = float(y) / float(mTileHeight);
      v /= float(g_TilesAcross);
      v += basev;

      for (int x = 0; x < mTileWidth - g_ShowTiles; x++)
      {
        float u = float(x) / float(mTileWidth);
        u /= float(g_TilesAcross);
        u += baseu;

        float U = u + mJitterX * du;
        float V = v + mJitterY * dv;

        Ray ray = mScene.mCamera._generateRay(U, V);

        int ypos = top + y;
        int xpos = left + x;

        PVector rgb = g_ShowNormals ?
          traceNormal(ray, 0, mScene.mSceneSize) :
          _trace(ray, 0, mScene.mSceneSize, xpos, ypos);

        addPixel(xpos, ypos, rgb, g_AccFrameCount == 0);
      }
    }
  }

  void addPixel(int x, int y, PVector pixel, boolean reset)
  {
      if (reset)
      {
        g_Picture[(y * g_FrameWidth + x) * 3] = pixel.x;
        g_Picture[(y * g_FrameWidth + x) * 3 + 1] = pixel.y;
        g_Picture[(y * g_FrameWidth + x) * 3 + 2] = pixel.z;
      }
      else
      {
        g_Picture[(y * g_FrameWidth + x) * 3] += pixel.x;
        g_Picture[(y * g_FrameWidth + x) * 3 + 1] += pixel.y;
        g_Picture[(y * g_FrameWidth + x) * 3 + 2] += pixel.z;
      }
  }
  
  PVector _computeSimpleSky(PVector dir)
  {
    float up = max(0,dir.y);
    return new PVector(0, up*0.25f, up*0.5f);  // Sky.
  }
  
  PVector _computeSky(PVector dir)
  {
//    int t = millis();
    
    float[] D = dir.array();
    
    int k = 0;
    for (int i = 1; i < 3; i++)
      if (abs(D[i]) > abs(D[k]))
        k = i;  // Dominant axis.

    if (D[k] < 0)
      k += 3;

    int face = _domToFace[k];
    int across = _faceToAxes[ face*3 ];  // u axis
    int down = _faceToAxes[ face*3+1 ];  // v axis
    int fwd = _faceToAxes[ face*3+2 ];   // w axis (dominant)
    
    float udir = D[across];
    float vdir = D[down];
    float wdir = D[fwd];  // dominant
    PVector uvdir = _cubify(udir, vdir, wdir);  // Returns [-1,1] for u and v
    
    // Get center of face in cube network
    float centeru = _faceToUv[face*2];
    float centerv = _faceToUv[face*2+1];
    
    // Map onto side of cube
    float u = centeru + uvdir.x * _uvScale[face*2];
    float v = centerv + uvdir.y * _uvScale[face*2+1];
    
    int x = (int)(u * (float)(g_IBL.width - 1));
    int y = (int)(v * (float)(g_IBL.height - 1));
    color pixel = g_IBL.get(x, y);
    
    float r = (float)((pixel & 0xff0000) >> 16) / 255.0f;
    float g = (float)((pixel & 0x00ff00) >> 8) / 255.0f;
    float b = (float)(pixel & 0x0000ff) / 255.0f;
    
    PVector sky = new PVector(r,g,b);
//    g_SkyTime += millis() - t;
    return sky;
  }
  
  
  PVector _trace(Ray ray, int depth, float sceneSize, int pixelX, int pixelY)
  {
    if (depth > g_MaxBounces)
      return new PVector(0,0,0);

    final boolean readDeepCache = g_EnableDeepCache && depth == 0;
    final boolean buildDeepCache = readDeepCache && g_AccFrameCount < (_jitters.length/2);
    final boolean useDeepCache = readDeepCache && !buildDeepCache;

    final int formula = pixelY * g_FrameWidth + pixelX;
    bvhNode startHere = g_DeepestNodes[formula];
    
    hitResult hit = mScene._intersect(ray, startHere, useDeepCache, pixelX, pixelY);
    
    if (hit.t <= 0)
        return g_UseIBL ? _computeSky(ray.mDir) : _computeSimpleSky(ray.mDir);

    if (hit.material.mLightSource)
        return new PVector(hit.material.mDiffuse.x,hit.material.mDiffuse.y, hit.material.mDiffuse.z);
        
    if (buildDeepCache)
    {
        // Record deepest node for this pixel.
        if (hit.node == null)
        {
        }
        else
        if (startHere == null)
        {
          assert(hit.node.mLeafNode);
          g_DeepestNodes[formula] = hit.node;
        }
        else
        if (startHere != hit.node)
        {
          // Find common ancestor.
          bvhNode n1 = startHere;
          bvhNode n2 = hit.node;
          
          assert(n2.mLeafNode);
          
          while (n1.mLevel > n2.mLevel)
            n1 = n1.mParent;
          while (n2.mLevel > n1.mLevel)
            n2 = n2.mParent;
            
          while (n1 != n2)
          {
            n1 = n1.mParent;
            n2 = n2.mParent;
            assert(!n1.mLeafNode);
          }
          g_DeepestNodes[formula] = n1;         
        }
    }

    PVector hitPoint = hit.calcHitPoint(ray);
    PVector hitNormal = hit.calcHitNormal(ray);
    
    PVector res = new PVector(0,0,0);

    if (hit.material.mGlass)
    {
        PVector refractDir = new PVector();
        float refractAmount = _refract(ray.mDir, hitNormal, 1.5f, refractDir);
//        refractAmount = max(0,refractAmount);
//        refractAmount = min(1,refractAmount);
        float reflectAmount = (1.0f - refractAmount);
        reflectAmount *= hit.material.mReflectivity; 
        
        // Reflect
        if (reflectAmount > 0 && g_UseReflection && depth == 0)
        {
            PVector reflectDir = _reflect(ray.mDir, hitNormal);
            Ray reflectRay = new Ray();
            reflectRay._init(hitPoint, reflectDir, reflectDir, 0.001f * sceneSize);
            
            PVector reflected = _trace(reflectRay, depth + 1, sceneSize, pixelX, pixelY);
            res.add( PVector.mult(reflected, reflectAmount) );
        }

        // Refract
        if (refractAmount > 0 && g_UseRefraction)
        {
          Ray refractRay = new Ray();
          refractRay._init(hitPoint, refractDir, refractDir, 0.001f * sceneSize);

          PVector refracted = _trace(refractRay, depth + 1, sceneSize, pixelX, pixelY);
          res.add( PVector.mult(refracted, refractAmount) );
        }
    }
    else
    if (hit.material.mReflectivity > 0 && g_UseReflection)
    {
        PVector reflectDir = _reflect(ray.mDir, hitNormal);

        // Reflect
        Ray reflectRay = new Ray();
        reflectRay._init(hitPoint, reflectDir, reflectDir, 0.001f * sceneSize);
        
        float cos_theta = PVector.dot(reflectDir, hitNormal);
        float reflectance = hit.material.mReflectivity;
        float BRDF = reflectance * cos_theta;  // the amount of light this object collects in this new direction

        PVector reflected = _trace(reflectRay, depth + 1, sceneSize, pixelX, pixelY);
        res.add( PVector.mult(reflected, BRDF) );  // incoming light is scaled by the BRDF and added to the object's emissive light
    }

    if (hit.material.mIsDiffuse)
    {
      // Check the cache.
      int key = g_UseCache ? g_IrradianceCache.makeKey(hitPoint) : -1;
      if (key >= 0)
      {
        int samples = g_IrradianceCache.getSampleCount(key);
        if (samples >= cacheSamples)
        {
          PVector irradiance = new PVector();
          g_IrradianceCache._get(key, irradiance);
          res.add(irradiance);
//          g_CacheHit++;
          return res;
        }
      }

      // Pick a random direction using equal area projection.
      float a = rand.nextFloat() * 2.0f * PI;    // [0,2*PI]
      float z = rand.nextFloat() * 2.0f - 1.0f;  // [-1,1]
      float rz = sqrt(1.0f - z*z);
      PVector newDir = new PVector(rz * cos(a), rz * sin(a), z);
      
      float cos_theta = PVector.dot(newDir, hitNormal);
      float sign = Math.signum(cos_theta);
      newDir.mult(sign);  // Ensure random dir is facing away from surface.
      cos_theta *= sign;
      
      Ray newRay = new Ray();
      newRay._init(hitPoint, hitNormal, newDir, 0.001f * sceneSize);
      
      float reflectance = 1;
      float BRDF = reflectance * cos_theta;  // the amount of light this object collects in this new direction
      
      PVector indirect = _trace(newRay, depth + 1, sceneSize, pixelX, pixelY);

      // Absorption
      indirect.x *= hit.material.mDiffuse.x;
      indirect.y *= hit.material.mDiffuse.y;
      indirect.z *= hit.material.mDiffuse.z;
      indirect.mult(BRDF);  // incoming light is scaled by the BRDF and added to the object's emissive light

      if (key >= 0)
      {
        // Update the cache.
        g_IrradianceCache._add(key, indirect);
        g_IrradianceCache._get(key, indirect);
//        g_CacheMiss++;
      }
      
      res.add( indirect );
    }
    
    return res;
  }


  PVector traceNormal(Ray ray, int depth, float sceneSize)
  {
    hitResult hit = mScene._intersect(ray, null, false, 0,0);
    
    if (hit.t <= 0)
        return new PVector(0,0,0);

    PVector hitNormal = hit.calcHitNormal(ray);
    
    PVector res = PVector.mult(hitNormal, 0.5f);
    res.add(0.5f, 0.5f, 0.5f);
    return res;
  }
  

  PVector computeDirect(Ray ray, hitResult hit)
  {
    assert(hit.t >= 0);
    assert(!hit.material.mLightSource);

    PVector res = new PVector(0, 0, 0);      

    PVector hitPoint = hit.calcHitPoint(ray);
    PVector hitNormal = hit.calcHitNormal(ray);

    for (int i = 0; i < lightSourceSamples; i++)
    {
        Ray toLight = mScene._generateRayToLight(hitPoint);
  
        PVector luminance = mScene._luminance(hitPoint, hitNormal, toLight);
  
        float ndotl = PVector.dot( hitNormal, toLight.mDir );
        ndotl = max(0, ndotl);
        res.add( PVector.mult(hit.material.mDiffuse, luminance.x * ndotl) );
    }
    
    if (lightSourceSamples > 1)
      res.div(lightSourceSamples);

//    res.add( PVector.mult( hit.material.mDiffuse, hit.material.mAmbient) );  // Ambient
    return res;
  }

  PVector _reflect(PVector incident, PVector normal)
  {
    // r = i - 2(i.n)n
    float twoidotn = 2.0f * PVector.dot(incident, normal);
    PVector R = PVector.sub(incident, PVector.mult( normal, twoidotn ) );
    return R;
  }

  // http://en.wikipedia.org/wiki/Snell's_law
  float _refract(PVector incident, PVector normal, float ior, PVector refractOut)
  {
    float n1,n2;
    float idotn = PVector.dot(incident, normal);
    if (idotn < 0.0f)
    {
        // entering glass
        n1 = 1.0f;
        n2 = ior;
    }
    else
    {
        // leaving glass
        n1 = ior;
        n2 = 1.0f;
    }
    float n = n1/n2;
    float cost = -idotn;
    
    // Reflect
//    PVector R3 = new PVector(-incident.x, -incident.y, -incident.z);
//    PVector R4 = PVector.mult(normal, 2.0f * cost);
//    reflectOut.set( PVector.add( R3, R4 ) );
//    reflectOut.normalize();  // ???

    float zzz = 1.0f - (n*n) * (1.0f - (cost*cost));
    if (zzz < 0.0f)
      return 0.0f;  // total internal reflection
    float cosi = sqrt( zzz );
    
    float x;
    if (cost >= 0)
      x = n * cost - cosi;
    else
      x = n * cost + cosi;

    // Refract
    PVector R1 = PVector.mult(incident, n);
    PVector R2 = PVector.mult(normal, x);
    refractOut.set( PVector.add(R1, R2) );
    refractOut.normalize();
    
    float refractAmount = ((n1 * cost) - (n2 * cosi)) / ((n1 * cost) + (n2 * cosi));
    refractAmount *= refractAmount;
    return refractAmount;
  }
/*
  float fresnel(PVector incident, PVector normal)
  {
    // Brighter reflections when viewed from the side; light is always straight up
    // (see http://filmicgames.com/archives/557 for better example)
    return max( 0.5f, min(1.0f, 0.1f + (1.0f + incident.y ) ) );
    //        return 1.0f - abs( incident.dot(normal) );
  }
*/
}


class Material
{
  //    Material() {}

  Material(PVector diffuse, float reflectivity, boolean lightSource, boolean glass)
  {
    _init(diffuse, reflectivity, lightSource, glass);
  }

  void _init(PVector diffuse, float reflectivity, boolean lightSource, boolean glass)
  {
    mDiffuse = diffuse;
    mReflectivity = reflectivity;
    mLightSource = lightSource;
    mGlass = glass;
    mIsDiffuse = diffuse.x + diffuse.y + diffuse.z > 0;
//    mIsDiffuse &= !mGlass;
  }

  PVector    mDiffuse;
  float      mReflectivity;
  boolean    mLightSource = false;
  boolean    mGlass = false;
  boolean    mIsDiffuse = false;
}

class hitResult
{
  float     t = 0.0f;
  float     u;
  float     v;
  
  tri       triangle = null;
  Material  material = null;
  bvhNode   node = null;

  PVector calcHitPoint(Ray ray)
  {
    // TODO: Could be written like calcHitNormal
    PVector v = new PVector();
    v.set(ray.mDir);
    v.mult(t);
    v.add(ray.mOrigin);
    return v;
  }

  PVector calcHitNormal(Ray ray)
  {
    PVector n1 = triangle.mVertexNormals[0];
    PVector n2 = triangle.mVertexNormals[1];
    PVector n3 = triangle.mVertexNormals[2];
    PVector N = new PVector();
    N.x = n1.x + u * (n2.x - n1.x) + v * (n3.x - n1.x);
    N.y = n1.y + u * (n2.y - n1.y) + v * (n3.y - n1.y);
    N.z = n1.z + u * (n2.z - n1.z) + v * (n3.z - n1.z);
    N.normalize();
    return N;
  }
}

// Accelerated triangle, Wald thesis
class tri
{
  // Not sure we need these permanently.
  PVector  mVertices[];
  PVector  mVertexNormals[];

  Material mMaterial = null;

  int      k, u, v;

  float nu;  // normal[ku] / normal[k]
  float nv;  // normal[kv] / normal[k]
  float nd;  // Plane equation constant

  float bu;
  float bv;
  float bd;

  float cu;
  float cv;
  float cd;

  tri() {
  }

  tri( objFile o, objTri t, Material mtl )
  {
    PVector a = o.mVertices.get( t.mVertexIndices[0] );
    PVector b = o.mVertices.get( t.mVertexIndices[1] );
    PVector c = o.mVertices.get( t.mVertexIndices[2] );

    PVector n1 = o.mVertexNormals.get( t.mVertexIndices[0] );
    PVector n2 = o.mVertexNormals.get( t.mVertexIndices[1] );
    PVector n3 = o.mVertexNormals.get( t.mVertexIndices[2] );
    initt(a, b, c, n1, n2, n3);
    setMaterial(mtl);
  }

  void initt(PVector a, PVector b, PVector c, PVector n1, PVector n2, PVector n3)
  {
    _accelerate(a, b, c);

    mVertexNormals = new PVector[3];
    mVertexNormals[0] = n1;
    mVertexNormals[1] = n2;
    mVertexNormals[2] = n3;
  }

  void _move(float dx, float dy, float dz, int vertex)
  {
    mVertices[vertex].add( new PVector(dx,dy,dz) );
    PVector a = new PVector(mVertices[0].x, mVertices[0].y, mVertices[0].z);
    PVector b = new PVector(mVertices[1].x, mVertices[1].y, mVertices[1].z);
    PVector c = new PVector(mVertices[2].x, mVertices[2].y, mVertices[2].z);
    _accelerate(a,b,c);
  }
  
  void setMaterial(Material mtl)
  {
    mMaterial = mtl;
  }

  void _accelerate(PVector a, PVector b, PVector c)
  {
    mVertices = new PVector[3];
    mVertices[0] = a;
    mVertices[1] = b;
    mVertices[2] = c;

    PVector bt = PVector.sub(c, a);
    PVector ct = PVector.sub(b, a);
    PVector n = ct.cross(bt);
    n.normalize();
    
    float[] A = a.array();
    float[] B = bt.array();
    float[] C = ct.array();
    float[] N = n.array();
    
    // Find dominant axis of the normal.
    k = 0;
    for (int i = 1; i < 3; i++)
      if (abs(N[i]) > abs(N[k]))
        k = i;

    u = (k + 1) % 3;
    v = (k + 2) % 3;

    // Precalcs.

    nu = N[u] / N[k];
    nv = N[v] / N[k];
    
    nd = A[u] * nu + A[v] * nv + A[k];  //PVector.dot(mNormal, mVertices[0]) / N[k];

    float denom = 1.0f / (B[u] * C[v] - B[v] * C[u]);

    bu = -B[v] * denom;
    bv = B[u] * denom;
    bd = (B[v] * A[u] - B[u] * A[v]) * denom;

    cu = C[v] * denom;
    cv = -C[u] * denom;
    cd = (-C[v] * A[u] + C[u] * A[v]) * denom;
  }

  boolean _intersect(Ray ray, hitResult hitOut)
  {
    float[] rayOrigin = ray.mOrigin.array();
    float[] rayDir = ray.mDir.array();
    
    final float d = 1.0f / (rayDir[k] + nu * rayDir[u] + nv * rayDir[v]);
    final float t = (nd - rayOrigin[k] - nu * rayOrigin[u] - nv * rayOrigin[v]) * d;

    if (t < ray.mMinT || t > ray.mMaxT)
      return false;

    // Compute hit point on the u/v plane.
    final float hu = rayOrigin[u] + rayDir[u] * t;
    final float hv = rayOrigin[v] + rayDir[v] * t;

    // Check first barycentric coordinate.
    final float lambda = hu * bu + hv * bv + bd;

    if (lambda < 0.0f)
      return false;

    // Check second barycentric coordinate.
    final float mu = hu * cu + hv * cv + cd;
    if (mu < 0.0f || ((lambda + mu) >= 1.0f))
      return false;

    // Valid hit.
    hitOut.t = t;
    hitOut.u = lambda;
    hitOut.v = mu;
    hitOut.material = mMaterial;
    hitOut.triangle = this;

    ray.mMaxT = t;  // Trim the end of the ray.
    return true;
  }
}

class objTri
{
  int mVertexIndices[];
  int mTexCoordIndices[];
  int mMaterialIndex = 0;

  public boolean readFace(String[] tokens, int materialIndex, objFile obj)
  {
    // (f is not in the token list)
    // 2394 1947 2398     // Vert
    // 3/1 4/2 5/3        // Vert, texcoord
    // 6/4/1 3/5/3 7/6/5  // Vert, texcoord, vert normal
    // 4//4 5//5 6//6     // Vert, vert normal
    // -1 -2 -3 -4        // relative verts

    mMaterialIndex = materialIndex;

    int vertexCount = tokens.length;  // 3

    mVertexIndices = new int[3];
    mTexCoordIndices = new int[3];

    for (int i = 0; i < vertexCount; i++)
    {
      String[] t = split(tokens[i], "//");

      // obj file indexes are 1-based

      if (t.length == 2)
      {
        // Vert, vert normal
        mVertexIndices[i] = int(t[0]) - 1;
        mTexCoordIndices[i] = -1;
        continue;
      }

      t = split(tokens[i], "/");

      if (t.length == 1)
      {
        // Vert
        mVertexIndices[i] = int(t[0]) - 1;
        mTexCoordIndices[i] = -1;
      }
      else
      if (t.length == 2)
      {
        // Vert, texcoord
        mVertexIndices[i] = int(t[0]) - 1;
        mTexCoordIndices[i] = int(t[1]) - 1;
      }
      else
      if (t.length == 3)
      {
        // Vert, texcoord, vert normal
        mVertexIndices[i] = int(t[0]) - 1;
        mTexCoordIndices[i] = int(t[1]) - 1;
      }
    }
    
      PVector a = obj.mVertices.get( mVertexIndices[0] );
      PVector b = obj.mVertices.get( mVertexIndices[1] );
      PVector c = obj.mVertices.get( mVertexIndices[2] );

      PVector bt = PVector.sub(c, a);
      PVector ct = PVector.sub(b, a);
      PVector n = ct.cross(bt);
      n.normalize();
      if (n.x==0.0f && n.y==0.0f && n.z == 0.0f)
        return false;  // degenerate
      return true;
  }
}

// One of these for each vertex; a list of faces for making vertex normals.
class objFaceList
{
  Vector<Integer> mFaceNumbers = new Vector();
}

class objFile
{
  String mFileName;

  Vector<PVector> mVertices;
  Vector<PVector> mTextureCoords;
  Vector<PVector> mVertexNormals;
  Vector<objTri>  mTriangles;
  Vector<Material> mMaterials;
  Vector<objFaceList> mVertexFaces;

  // Loading state
  int mCurrentMaterialIndex = -1;
  boolean  mVertexBlock = false;

  objFile()
  {
    mFileName = null;
    mVertices = new Vector();
    mTextureCoords = new Vector();
    mVertexNormals = new Vector();
    mTriangles = new Vector();
    mVertexFaces = new Vector();
  }

  public void loadOBJ(String fileName, Vector<Material> materials)
  {
    mFileName = fileName;

    // These have to be known in advance
    mMaterials = materials;

    BufferedReader input = null;

    try {

      input = createReader(fileName);

      String line = null;

      try {

        while ( (line = input.readLine ()) != null)
        {
          int i;
          if (line.indexOf("v ") != -1)
            readVertex(line);
          else
            if (line.indexOf("vn ") != -1)
              readVertexNormal(line);
            else
              if (line.indexOf("vt ") != -1)
                readTextureCoord(line);
              else
                if (line.indexOf("f ") != -1)
                  readFace(line);
                else
                  if (line.indexOf("usemtl") != -1)
                    readMaterial(line);
        }
      } 
      catch (java.lang.Throwable t) {
        System.out.println( t.getClass().getName() );
        t.printStackTrace();
      }
    } 
    finally {
      try {

        input.close();
      } 
      catch (java.lang.Throwable t) {
        System.out.println( t.getClass().getName() );
        t.printStackTrace();
      }
    }

//    if (mVertexNormals.size() > 0)
//      return;

    mVertexNormals.setSize(0);

    // Invent vertex normals.

    int vertexCount = mVertices.size();
    int triangleCount = mTriangles.size();

    println("Making vertex normals from " + triangleCount + " triangles");

    // Make face normals.
    Vector<PVector> faceNormals = new Vector<PVector>();

    for (int i = 0; i < triangleCount; i++)
    {
      objTri tri = mTriangles.get(i);

      PVector a = mVertices.get( tri.mVertexIndices[0] );
      PVector b = mVertices.get( tri.mVertexIndices[1] );
      PVector c = mVertices.get( tri.mVertexIndices[2] );

      PVector bt = PVector.sub(c, a);
      PVector ct = PVector.sub(b, a);
      PVector n = ct.cross(bt);
      n.normalize();
     
      faceNormals.addElement(n);
    }
    
    
    for (int i = 0; i < vertexCount; i++)
    {
      final int faceCount = mVertexFaces.get(i).mFaceNumbers.size();

      PVector vertexNormal = new PVector(0,0,0);
      
      for (int j = 0; j < faceCount; j++)
      {
        int faceNumber = mVertexFaces.get(i).mFaceNumbers.get(j);
        
        vertexNormal.add( faceNormals.get(faceNumber) );
      }
      
      if (faceCount > 0)
        vertexNormal.normalize();
        
      mVertexNormals.addElement( vertexNormal );
    }
   
  }

  void printStats()
  {
    println("Vertices = " + mVertices.size() + ", vertex normals = " + mVertexNormals.size() + ", triangles = " + mTriangles.size());
  }

  void readVertex(String str)
  {
    if (!mVertexBlock)
    {
      // New vertex block is new material.
      mVertexBlock = true;
      mCurrentMaterialIndex++;
    }

    String[] pieces = splitTokens(str, " ");  // v -0.360560 -0.204656 0.554856

    PVector v;
    v = new PVector(float(pieces[1]), float(pieces[2]), float(pieces[3]));
    mVertices.addElement(v);
    mVertexFaces.addElement( new objFaceList() );
  }

  void readVertexNormal(String str)
  {
    mVertexBlock = false;

    String[] pieces = splitTokens(str, " ");  // vn 0.630024 0.428114 0.647847

    PVector v;
    v = new PVector(float(pieces[1]), float(pieces[2]), float(pieces[3]));
    mVertexNormals.addElement(v);
  }

  void readTextureCoord(String str)
  {
    mVertexBlock = false;

    String[] pieces = splitTokens(str, " ");  // vt 1.000000 3.000000

    PVector v;
    v = new PVector(float(pieces[1]), float(pieces[2]));
    mTextureCoords.addElement(v);
  }   

  void readFace(String str)
  {
    mVertexBlock = false;

    // f 2394 1947 2398     // Vert
    // f 3/1 4/2 5/3        // Vert, texcoord
    // f 6/4/1 3/5/3 7/6/5  // Vert, texcoord, vert normal
    // f 4//4 5//5 6//6     // Vert, vert normal
    // f -1 -2 -3 -4        // relative verts

    String[] tokens = splitTokens(str, " ");

    int vertexCount = tokens.length - 1;  // 3 for triangles

    assert(vertexCount == 3 || vertexCount == 4);

    String[] tokensA = new String[3];
    tokensA[0] = tokens[1];
    tokensA[1] = tokens[2];
    tokensA[2] = tokens[3];

    // Add this face
    int faceNumber = mTriangles.size();
    objTri tri = new objTri();
    boolean valid = tri.readFace(tokensA, mCurrentMaterialIndex, this);
    if (!valid)
      return;  // degenerate
    mTriangles.addElement(tri);

    // Add this face to the vertex
    int vertsInFace = mTriangles.get(faceNumber).mVertexIndices.length;  // 3
    assert(vertsInFace == 3);
    for (int i = 0; i < vertsInFace; i++)
    {
      int vertIndex = mTriangles.get(faceNumber).mVertexIndices[i];
      mVertexFaces.get(vertIndex).mFaceNumbers.addElement( new Integer(faceNumber) );
    }
    
    if (vertexCount == 4)
    {
      String[] tokensB = new String[3];

      tokensB[0] = tokens[3];
      tokensB[1] = tokens[4];
      tokensB[2] = tokens[1];

      // Add this face
      faceNumber = mTriangles.size();
      tri = new objTri();
      valid = tri.readFace(tokensB, mCurrentMaterialIndex, this);
    if (!valid)
      return;  // degenerate
      mTriangles.addElement(tri);
  
      // Add this face to the vertex
      vertsInFace = mTriangles.get(faceNumber).mVertexIndices.length;  // 3
      assert(vertsInFace == 3);
      for (int i = 0; i < vertsInFace; i++)
      {
        int vertIndex = mTriangles.get(faceNumber).mVertexIndices[i];
        mVertexFaces.get(vertIndex).mFaceNumbers.addElement( new Integer(faceNumber) );
      }
    }
  }

  void readMaterial(String str)
  {
  }
}


PVector minv(PVector a, PVector b)
{
  return new PVector(min(a.x, b.x), min(a.y, b.y), min(a.z, b.z));
}

PVector maxv(PVector a, PVector b)
{
  return new PVector(max(a.x, b.x), max(a.y, b.y), max(a.z, b.z));
}

float max4( float a, float b, float c, float d)
{
  return max(max(a, b), max(c, d));
}

float min4( float a, float b, float c, float d)
{
  return min(min(a, b), min(c, d));
}


class AABB
{
  PVector  mMin;
  PVector  mMax;

  AABB()
  {
    final float large = 10000000.0f;
    mMin = new PVector(large, large, large);
    mMax = new PVector(-large, -large, -large);
  }

  void _grow(PVector v)
  {
    mMin = minv(mMin, v);
    mMax = maxv(mMax, v);
  }

  void _grow(AABB aabb)
  {
    mMin = minv(mMin, aabb.mMin);
    mMax = maxv(mMax, aabb.mMax);
  }

  float surfaceArea()
  {
    return 2.0f * (mMax.x - mMin.x) * (mMax.y - mMin.y) * (mMax.z - mMin.z);
  }

  void _print()
  {
    println("aabb: min(" + mMin.toString() + "), max(" + mMax.toString() + ")" );
  }
}


class primBound
{
  AABB     mBound;
  float[]  mCenter;
  tri      mTriangle;

  primBound(tri t)
  {
    mTriangle = t;

    mBound = new AABB();
    mBound._grow(t.mVertices[0]);
    mBound._grow(t.mVertices[1]);
    mBound._grow(t.mVertices[2]);

    PVector center = PVector.mult( PVector.add(mBound.mMin, mBound.mMax), 0.5f );
    mCenter = new float[3];
    mCenter[0] = center.x;
    mCenter[1] = center.y;
    mCenter[2] = center.z;
  }
}


int g_MaxNodeLevel = 0;
int g_NodeNumber = 0;

class bvhNode
{
  AABB           mBound;  // Bound around all triangles.
  tri[]          mTriangles;
  primBound[]    mPrimBounds;

  // Children.
  bvhNode        mLeft;
  bvhNode        mRight;
  
  bvhNode        mParent;
  int            mLevel;
  int            mNumber;

  boolean        mLeafNode;

  bvhNode(int number)
  {
    mLeft = null;
    mRight = null;
    mParent = null;
    mLevel = 0;
    mLeafNode = false;
    mNumber = number;
  }

  hitResult _intersect(Ray ray, boolean dtrace)
  {
    hitResult hit = new hitResult();
    _intersect(ray, hit, dtrace);
    return hit;
  }


/*
   "Persistent while-while kernel" used in:
   "Understanding the Efficiency of Ray Traversal on GPUs",
   Timo Aila and Samuli Laine,
   Proc. High-Performance Graphics 2009
   http://drupal.blendercn.org/tmp/cycles_2f091f520688c183b2ae38d3fd5bc5f4ad0c64d5.pdf, Page 150
*/
  void _intersect(Ray ray, hitResult hitOut, boolean dtrace)
  {
    // Test ray against any triangles in this node.
    
    if (dtrace)
    {
      println("# "+mNumber+", leaf = "+mLeafNode);  //+", node="+this);
      println("\t" + ray.mDir);
    }

    if (mLeafNode)
    {
//      int t = millis();
      for (int i = 0; i < mTriangles.length; i++)
      {
        if ( mTriangles[i]._intersect(ray, hitOut) )
        {
          if (dtrace)
            println("HIT TRI[" + i +"] # "+mNumber);  //+", node=" + this);
          hitOut.node = this;
        }
      }
//      g_TriAccelTime += millis() - t;

      return;
    }

    // Intersect the ray against the child nodes.

    // idir is inverse ray direction
    float minT = ray.mMinT;
    float maxT = ray.mMaxT;

    float idirx = ray.mInvDir.x;
    float idiry = ray.mInvDir.y;
    float idirz = ray.mInvDir.z;

    float oodx = ray.mOrigin.x * idirx;
    float oody = ray.mOrigin.y * idiry;
    float oodz = ray.mOrigin.z * idirz;
    
    // Fetch AABBs of the two child nodes.
    AABB n0 = mLeft.mBound;
    AABB n1 = mRight.mBound;

    float c0lox = n0.mMin.x * idirx - oodx;
    float c0hix = n0.mMax.x * idirx - oodx;

    float c0loy = n0.mMin.y * idiry - oody;
    float c0hiy = n0.mMax.y * idiry - oody;

    float c0loz = n0.mMin.z  * idirz - oodz;
    float c0hiz = n0.mMax.z  * idirz - oodz;

    float c1loz = n1.mMin.z  * idirz - oodz;
    float c1hiz = n1.mMax.z  * idirz - oodz;

    float c0min = max4( min(c0lox, c0hix), min(c0loy, c0hiy), min(c0loz, c0hiz), minT);
    float c0max = min4( max(c0lox, c0hix), max(c0loy, c0hiy), max(c0loz, c0hiz), maxT);

    float c1lox = n1.mMin.x  * idirx - oodx;
    float c1hix = n1.mMax.x * idirx - oodx;

    float c1loy = n1.mMin.y  * idiry - oody;
    float c1hiy = n1.mMax.y * idiry - oody;

    float c1min = max4(min(c1lox, c1hix), min(c1loy, c1hiy), min(c1loz, c1hiz), minT);
    float c1max = min4(max(c1lox, c1hix), max(c1loy, c1hiy), max(c1loz, c1hiz), maxT);
    
    // TODO: update ray mint, maxt?

    // Decide where to go next.
    boolean hitLeft = (c0max >= c0min);
    boolean hitRight = (c1max >= c1min);

    if (hitLeft && hitRight)
    {
      if (c0min < c1min)
      {
        mLeft._intersect(ray, hitOut, dtrace);
        mRight._intersect(ray, hitOut, dtrace);
      }
      else
      {
        mRight._intersect(ray, hitOut, dtrace);
        mLeft._intersect(ray, hitOut, dtrace);
      }
    }
    else
    if (hitLeft)
    {
      mLeft._intersect(ray, hitOut, dtrace);
    }
    else
    if (hitRight)
    {
      mRight._intersect(ray, hitOut, dtrace);
    }

    return;
  }


  //
  // Make a copy of the objFile indexed triangles as a list of simple triangles,
  // and make bounding boxes around the triangles.
  //
  void _initRootNode(objFile obj)
  {
    mLeft = null;
    mRight = null;
    mParent = null;
    mLevel = 0;

    final int triangleCount = obj.mTriangles.size();

    mTriangles = new tri[triangleCount];
    for (int i = 0; i < triangleCount; i++)
    {
      objTri ot = obj.mTriangles.get(i);
      int mtlIndex = 0;  // HACK TEST!!! ot.mMaterialIndex;
      Material mtl = obj.mMaterials.get(mtlIndex);            
      mTriangles[i] = new tri(obj, ot, mtl);
    }

    // Make bounding boxes around the triangles.

    mPrimBounds = new primBound[triangleCount];
    for (int i = 0; i < triangleCount; i++)
    {
      mPrimBounds[i] = new primBound(mTriangles[i]);
    }

    mBound = _growBounds(mPrimBounds, 0, mPrimBounds.length - 1);

    mLeafNode = true;

    _Sanity();
  }


  void _initChildNode(bvhNode parent, int start, int end)
  {
    int t = millis();
    
    mLeft = null;
    mRight = null;
    mParent = parent;
    mLevel = parent.mLevel + 1;

    final int primCount = end - start + 1;
    assert(primCount > 0);

    mTriangles = new tri[primCount];
    mPrimBounds = new primBound[primCount];

    for (int i = 0; i < primCount; i++)
    {
      primBound pb = parent.mPrimBounds[start + i];

      mTriangles[i] = pb.mTriangle;
      mPrimBounds[i] = pb;
    }

    mBound = _growBounds(mPrimBounds, 0, mPrimBounds.length - 1);

    _Sanity();
    
    bt4 += millis() - t;
  }

  void _Sanity()
  {
    for (int i = 0; i < mTriangles.length; i++)
    {
      assert(mTriangles[i].mVertices[0].x <= mBound.mMax.x);
      assert(mTriangles[i].mVertices[1].y <= mBound.mMax.y);
      assert(mTriangles[i].mVertices[2].z <= mBound.mMax.z);
      assert(mTriangles[i].mVertices[0].x >= mBound.mMin.x);
      assert(mTriangles[i].mVertices[1].y >= mBound.mMin.y);
      assert(mTriangles[i].mVertices[2].z >= mBound.mMin.z);
    }
  }


  void _buildTree()
  {
    if (mTriangles.length < 5)  // Carefully tuned for speed
    {
      mLeafNode = true;
      g_MaxNodeLevel = max(mLevel, g_MaxNodeLevel);
      return;
    }
    else
      mLeafNode = false;

    // Compute cheapest SAH along each axis, and select the cheapest of the cheapests.
    int cheapestAxis = -1;
    int cheapestSplit = -1;
    float cheapest = 10000000.0f;

    // Binary search
    // Doesn't create the optimal tree, but orders of magnitude faster to build
    // than linear search for large models (100,000+ triangles)

    for (int axis = 0; axis < 3; axis++)
    {
      _sortBounds( mPrimBounds, axis );
      
      int low = 0;
      int high = mPrimBounds.length - 1;
      int middle = (low + high) / 2;
      int lower = (low + middle) / 2;
      int upper = (high + middle) / 2;
      
      boolean stop = false;
      
      while (!stop)
      {
          float middlecost = _computeCost(mPrimBounds, middle, mBound);
          float lowercost = _computeCost(mPrimBounds, lower, mBound);
          float uppercost = _computeCost(mPrimBounds, upper, mBound);
          
          if (middlecost < cheapest)
          {
            cheapestAxis = axis;
            cheapestSplit = middle;
            cheapest = middlecost;
          }
          
          if (lowercost < middlecost)
              upper = middle;
          else
              lower = middle;
          
          middle = (lower + upper) / 2;

          stop = lower == middle || upper == middle;
      }
    }

    _sortBounds( mPrimBounds, cheapestAxis );
    
    // Perform the split.

    mLeft = new bvhNode(g_NodeNumber++);
    mRight = new bvhNode(g_NodeNumber++);

    mLeft._initChildNode(this, 0, cheapestSplit - 1);
    mRight._initChildNode(this, cheapestSplit, mPrimBounds.length - 1);

    mTriangles = null;
    mPrimBounds = null;

    mLeft._buildTree();
    mRight._buildTree();
  }

  float _computeCost(primBound[] bounds, int split, AABB B)
  {
    /*
     http://www.nvidia.com/docs/IO/77714/sbvh.pdf
     
            SA(B1)           SA(B2)
Cost = Ct + ------ |P1| Ci + ------ |P2| Ci
            SA(B)            SA(B)
     
     where
     
     Ct is cost of traversal step
     |P1| and |P2| is the number of primitives in each subset
     Ci is the cost of a single ray/primitive intersection
     (B) is the parent node
     (B1) is the "left" subdivided node
     (B2) is the "right" subdivided node
     */
     
    int t = millis();
    
    AABB B1 = _growBounds(bounds, 0, split - 1);
    AABB B2 = _growBounds(bounds, split, bounds.length - 1);

    int P1 = split;
    int P2 = bounds.length - split;

    float Ct = 1.0f;
    float Ci = 1.0f;

    float sah1 = _computeSAH(B1, B);
    float sah2 = _computeSAH(B2, B);

    float cost = Ct;
    cost += sah1 * (float)P1 * Ci;
    cost += sah2 * (float)P2 * Ci;
    
    bt3 += millis() - t;

    return cost;
  }

  float _computeSAH(AABB child, AABB parent)
  {
    float psa = parent.surfaceArea();
    if (psa < 0.00001f)  // TODO: Why? (triceratops)
      return 1;
    else
      return child.surfaceArea() / psa;
  }

  AABB _growBounds(primBound[] bounds, int start, int end)
  {
    AABB aabb = new AABB();

    for (int i = start; i <= end; i++)
      aabb._grow(bounds[i].mBound);

    return aabb;
  }

  void _sortBounds(primBound[] bounds, int axis)
  {
    // Comb sort.
    final int size = bounds.length;
    final float shrink = 1.3f;  // 1.247330950103979f;
    
    int t = millis();
    int gap = size;
    boolean swapped = false;

    while (gap > 1 || swapped)
    {
      if (gap > 1)
        gap = (int)((float)gap / shrink);

      swapped = false;

      for (int i = 0; gap + i < size; i++)
      {
        float a = bounds[i].mCenter[axis];
        float b = bounds[i + gap].mCenter[axis];

        if (a > b)
        {
          primBound tmp = bounds[i];
          bounds[i] = bounds[i + gap];
          bounds[i + gap] = tmp;
          swapped = true;
        }
      }
    }
    
    bt2 += millis() - t;
  }

  int _countNodes()
  {
    int count = 1;
    try {
      count += mLeft._countNodes();
    } 
    catch (NullPointerException  e) {
    }

    try {
      count += mRight._countNodes();
    } 
    catch (NullPointerException  e) {
    }

    return count;
  }

  int _countTriangles()
  {
    int count = 0;

    try {
      count += mTriangles.length;
    } 
    catch (NullPointerException  e) {
    }

    try {
      count += mLeft._countTriangles();
    } 
    catch (NullPointerException  e) {
    }

    try {
      count += mRight._countTriangles();
    } 
    catch (NullPointerException  e) {
    }

    return count;
  }
}

class SceneData
{
  SceneData()
  {
    mObjectMaterials = new Vector<Material>();
  }

  void _init(String objFileName, Material objectMtl, Material groundMtl)
  {
    mObjFileName = objFileName;
    mGroundMtl = groundMtl;
  }

  String mObjFileName;
  Material mGroundMtl;
  Vector<Material> mObjectMaterials;
}

// build tree timers
int bt1 = 0;
int bt2 = 0;
int bt3 = 0;
int bt4 = 0;

class Scene
{
  bvhNode mBVH;
  Quad mAreaLight;
  Quad mGround;
  Camera mCamera;
  float mSceneSize = 1.0f;  // Scalar for camera controls and ray bias

  Scene()
  {
    SceneData data;
/*
    data = new SceneData();
    g_SceneData.addElement(data);
    data.mObjFileName = "sponza.obj";
    data.mGroundMtl = new Material( new PVector(0.25f, 0.0f, 0.0f), 0.0f, false, false);  // diffuse, reflectivity, light, glass
    data.mObjectMaterials.addElement( new Material( new PVector(1.0f, 1.0f, 1.0), 0.0f, false, false) );
*/
    data = new SceneData();
    g_SceneData.addElement(data);
    data.mObjFileName = "teapot.obj";  // 8,480
    data.mGroundMtl = new Material( new PVector(0.05f, 0.3f, 0.6f), 0.5f, false, false);  // diffuse, reflectivity, light, glass
    data.mObjectMaterials.addElement( new Material( new PVector(1.0f, 0.0f, 0.0), 0.1f, false, false) );

    data = new SceneData();
    g_SceneData.addElement(data);
    data.mObjFileName = "knot.obj";  // 11,616
    data.mGroundMtl = new Material( new PVector(0.6f, 0.1f, 0.1f), 0.075f, false, false);  // diffuse, reflectivity, light, glass
    data.mObjectMaterials.addElement( new Material( new PVector(0.16f, 0.3f, 1.0f), 0.3f, false, false) );

    data = new SceneData();
    g_SceneData.addElement(data);
    data.mObjFileName = "sphere.obj";  // 20,480
    data.mGroundMtl = new Material( new PVector(1,0,0), 0.5, false, false);  // diffuse, reflectivity, light, glass
    data.mObjectMaterials.addElement( new Material( new PVector(0,0,0), 0.25f, false, true) );
/*
    data = new SceneData();
    g_SceneData.addElement(data);
    data.mObjFileName = "spock.obj";  // 3,525
    data.mGroundMtl = new Material( new PVector(1.75f, 1.75f, 0.0f), 1.0f, false, false);  // diffuse, reflectivity, light, glass
    data.mObjectMaterials.addElement( new Material( new PVector(0.7f, 0.7f, 0.9f), 0.075f, false, false) );
*/
    data = new SceneData();
    g_SceneData.addElement(data);
    data.mObjFileName = "griffin.obj";
    data.mGroundMtl = new Material( new PVector(0.54f, 0.02f, 0.25f), 0.0f, false, false);  // diffuse, reflectivity, light, glass
    data.mObjectMaterials.addElement( new Material( new PVector(0.3f, 0.2f, 1.2f), 0.0f, false, true) );
    
    data = new SceneData();
    g_SceneData.addElement(data);
    data.mObjFileName = "triceratops.obj";  // 5,660
    data.mGroundMtl = new Material( new PVector(0.2f, 1.0f, 1.0f), 0.5f, false, false);  // diffuse, reflectivity, light, glass
    data.mObjectMaterials.addElement( new Material( new PVector(0.05f, 0.5f, 0.05f), 0.1f, false, false) );
    
    data = new SceneData();
    g_SceneData.addElement(data);
    data.mObjFileName = "tRex.obj";  // 112,624
    data.mGroundMtl = new Material( new PVector(0.0f, 0.0f, 0.3f), 0.65f, false, false);  // diffuse, reflectivity, light, glass
    data.mObjectMaterials.addElement( new Material( new PVector(1.0f, 1.0f, 1.0f), 0.0f, false, false) );
  }


  hitResult _intersect(Ray ray, bvhNode startHere, boolean useStart, int pixelX, int pixelY)
  {
//    int t = millis();

    hitResult hit1 = null;
    
    if (useStart)
    {
      if (startHere != null)
      {
        hit1 = startHere._intersect(ray, false);
//        assert(mBVH.intersect(ray, false).t == hit1.t);  // Check that optimized trace matches full trace
      }
      else
      {
        // No hit.
        hit1 = new hitResult();
      }
    }
    else
    {
      // Check the whole scene.
      hit1 = mBVH._intersect(ray, false);
    }

    hitResult hit2 = mAreaLight._intersect(ray);
    hitResult hit3 = mGround._intersect(ray);

    float neart = 1000000.0f;
    hitResult nearest = hit1;

    if (hit1.t > 0 && hit1.t < neart)
    {
      neart = hit1.t;
      nearest = hit1;
    }
    if (hit2.t > 0 && hit2.t < neart)
    {
      neart = hit2.t;
      nearest = hit2;
      assert(nearest.node == null);
    }
    if (hit3.t > 0 && hit3.t < neart)
    {
      neart = hit3.t;
      nearest = hit3;
      assert(nearest.node == null);
    }
    
//    g_IntersectTime += millis() - t;
    return nearest;
  }

  void _init(SceneData data)
  {
    // Load the object.
    objFile obj = new objFile();

    println("Loading '" + data.mObjFileName + "'");

    obj.loadOBJ(data.mObjFileName, data.mObjectMaterials);
    obj.printStats();

    // Process the object.
    println("Building BVH...");
    g_MaxNodeLevel = 0;
    g_NodeNumber = 0;
    mBVH = new bvhNode(g_NodeNumber++);
    mBVH._initRootNode(obj);

    println("\tTriangles in object = " + mBVH._countTriangles());
    bt1 = millis();
    bt2 = 0;
    bt3 = 0;
    bt4 = 0;
    mBVH._buildTree();
    bt1 = millis() - bt1;
    println("\tTotal build time " + bt1 + ", sort " + bt2 + ", computeCost " + bt3 + ", initChild " + bt4);

    println("\tNodes in tree " + mBVH._countNodes()+ ", deepest " + g_MaxNodeLevel);
    println("\tTriangles in tree = " + mBVH._countTriangles());
    mBVH.mBound._print();

    float minx = mBVH.mBound.mMin.x;
    float miny = mBVH.mBound.mMin.y;
    float minz = mBVH.mBound.mMin.y;
    float maxy = mBVH.mBound.mMax.y;

    final float objwidth = mBVH.mBound.mMax.x - mBVH.mBound.mMin.x;
    final float objdepth = mBVH.mBound.mMax.z - mBVH.mBound.mMin.z;
    final float objheight = mBVH.mBound.mMax.y - mBVH.mBound.mMin.y;

    mSceneSize = (objwidth+objheight+objdepth) / 3.0f;

    // Place ground underneath object.
    mGround = new Quad();
    final float groundScale = 0.55f;  // 0.5 covers object
    PVector[] corners1 = new PVector[4];
    float objsize = max(objwidth, objdepth);
    corners1[0] = new PVector(-objsize * groundScale, miny, objsize * groundScale);
    corners1[1] = new PVector( objsize * groundScale, miny, objsize * groundScale);
    corners1[2] = new PVector( objsize * groundScale, miny, -objsize * groundScale);
    corners1[3] = new PVector(-objsize * groundScale, miny, -objsize * groundScale);
    mGround._init(corners1[0], corners1[1], corners1[2], corners1[3], new PVector(0, 1, 0));
    mGround._setMaterial(data.mGroundMtl);

    // Place light above object.
    mAreaLight = new Quad();
    final float lightScale = 0.5f;  // 0.5 covers object
    final float heightScale = 1.85f;  //1.75f;  // 1.0 = top of object
    final float lighty = miny + ((maxy - miny) * heightScale);
    objsize = max(objwidth, objdepth);

    PVector[] corners2 = new PVector[4];
    corners2[0] = new PVector(-objsize * lightScale, lighty, objsize * lightScale);
    corners2[1] = new PVector( objsize * lightScale, lighty, objsize * lightScale);
    corners2[2] = new PVector( objsize * lightScale, lighty, -objsize * lightScale);
    corners2[3] = new PVector(-objsize * lightScale, lighty, -objsize * lightScale);
    mAreaLight._init(corners2[0], corners2[1], corners2[2], corners2[3], new PVector(0, -1, 0));
    Material lightMtl = new Material(new PVector(3, 3, 3), 0, true, false);  // diffuse, reflectivity, light, glass
    lightMtl.mLightSource = true;
    mAreaLight._setMaterial(lightMtl);

    // Set up camera.
    PVector pivot = new PVector();
    pivot.set(minx, miny, minz);
    pivot.add( PVector.mult( new PVector(objwidth, objheight, objdepth), 0.5f ) );
    float zoomy = mSceneSize * -2.2f;
    mCamera = new Camera(pivot, zoomy);
  }

  void _shutdown()
  {
    mBVH = null;
    mAreaLight = null;
    mGround = null;
    mCamera = null;
    System.gc();
  }

  Ray _generateRayToLight(PVector hitPoint)
  {
    float s = rand.nextFloat();
    float t = rand.nextFloat();
    
    return mAreaLight._generateRay(hitPoint, s, t, mSceneSize);  // Towards light.
  }


  PVector _luminance(PVector hitPoint, PVector hitNormal, Ray toLight)
  {
    hitResult lightHit = mAreaLight._intersect(toLight);

    hitResult objectHit = mBVH._intersect(toLight, false);

    float t1 = objectHit.t;
    float t2 = lightHit.t;

    float shadow = 1.0f;
    if (t1 > 0)
    {
      if (t2 > 0)
      {
        if (t1 < t2)
        {
          shadow = 0.0f;  // Shadowed.
        }
      }
    }

    if (t2 > 0 && shadow > 0)
    {
      // We can see the light from here.
      PVector lightPos = lightHit.calcHitPoint(toLight);

      float dist = PVector.dist(lightPos, hitPoint);
      float atten = 1.0f;  // / dist;
      PVector res = PVector.mult(lightHit.material.mDiffuse, atten);
      return res;
    }

    return _black;
  }
/*
  void moveAreaLight(float dx, float dy, float dz)
  {
    g_IrradianceCache.flush();
    g_AccFrameCount = 0;
    
    PVector right = new PVector(mCamera.mRotation.m00, mCamera.mRotation.m01, mCamera.mRotation.m02);
    PVector up = new PVector(mCamera.mRotation.m10, mCamera.mRotation.m11, mCamera.mRotation.m12);
    PVector fwd = new PVector(mCamera.mRotation.m20, mCamera.mRotation.m21, mCamera.mRotation.m22);
    float xstep = right.x * dx + right.z * dz;
    float ystep = -up.y * dy;
    float zstep = -fwd.x * dx + -fwd.z * dz;
    mAreaLight.move(xstep * g_Scene.mSceneSize, ystep * g_Scene.mSceneSize, zstep * g_Scene.mSceneSize);
  }

  void resizeAreaLight(float dx, float dy)
  {
    g_IrradianceCache.flush();
    g_AccFrameCount = 0;
    mAreaLight.resize(-dx * g_Scene.mSceneSize);
  }
*/
}


/*
void mouseWheel(int step)
{
  float dy = step * 0.1f;
  g_Scene.mCamera.zoom(dy, g_Scene.mSceneSize);
}
*/

/* @pjs preload="picture.jpg"; */
PImage g_IBL = null;
int g_ThreadCount = 0;


void setup()
{
  assert(g_FrameWidth==384 && g_FrameHeight==384);
  size(384, 384);  // Fixed values required for export

/*
// Doesn't work well in a web page.
  addMouseWheelListener(
  new java.awt.event.MouseWheelListener()
  {
    public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt)
    {
      mouseWheel(evt.getWheelRotation());
    }
  }
  );
*/

//http://www.pauldebevec.com/Probes/
//  g_IBL = loadImage("uffizi_cross.jpg");
//  g_IBL = loadImage("xyz.jpg");

  g_Scene = new Scene();

  Runtime rt = Runtime.getRuntime();
  rt.gc();
  println("At program start we have : " + rt.freeMemory() / 1024 + " Mbytes");

  g_ThreadCount = Runtime.getRuntime().availableProcessors();
  println("Available processors = " + g_ThreadCount);

  // Set up the worker threads.
  g_Workers = new WorkQueue(g_ThreadCount);

  g_FrameBuffer = createImage(g_FrameWidth, g_FrameHeight, RGB);

  g_Picture = new float[g_FrameWidth * g_FrameHeight * 3];
  
  g_DeepestNodes = new bvhNode[g_FrameWidth * g_FrameHeight];
  for (int i = 0; i < g_DeepestNodes.length; i++)
    g_DeepestNodes[i] = null;
    
  g_AccFrameCount = 0;
  
  
}

void mouseDragged()
{
  float dx = (float)(mouseX - pmouseX) / width;
  float dy = (float)(mouseY - pmouseY) / height;
/*  
  if (keyPressed && (keyCode == CONTROL))
  {
    if (mouseButton == LEFT)
      g_Scene.moveAreaLight(dx, 0, dy);
    else
    if (mouseButton == RIGHT)
    {
      g_Scene.resizeAreaLight(dx, dy);
      g_Scene.moveAreaLight(0, dy, 0);
    }
  }
  else*/
  if (mouseButton == LEFT)
    g_Scene.mCamera._rotate(dx, dy);
  else
  if (mouseButton == RIGHT)
  {
    g_Scene.mCamera._translate(dx, 0, g_Scene.mSceneSize);
    g_Scene.mCamera._zoom(dy, g_Scene.mSceneSize);
  }
}


int g_CurrentScene = -1;
int g_NextScene = 0;
int g_FrameCount = 0;

final float _jitters[] =
{
  0.27624023, 0.7383591, 
  0.36448407, 0.42610216, 
  0.31644678, 0.5084625, 
  0.73408026, 0.64622825, 
  0.03776717, 0.92594254, 
  0.8834134, 0.99545485, 
  0.44944513, 0.96890223, 
  0.4371891, 0.40201145, 
  0.6145841, 0.38616186, 
  0.029957294, 0.48412257, 
  0.037918985, 0.9323899, 
  0.9584937, 0.3591541, 
  0.48877925, 0.22481102, 
  0.9620812, 0.42511326, 
  0.7678585, 0.14241791, 
  0.09161526, 0.883179, 
  0.78636545, 0.78934026, 
  0.41826004, 0.20761043, 
  0.13976353, 0.4390018, 
  0.66423136, 0.38460332, 
/*  0.74377716, 0.4448068, 
  0.119415045, 0.42213565, 
  0.31644326, 0.55435133, 
  0.11079335, 0.21937841, 
  0.68612504, 0.18367666, 
  0.0055217147, 0.42079628, 
  0.37162662, 0.11014509, 
  0.20707881, 0.86369556, 
  0.29751307, 0.41948485, 
  0.8169307, 0.8588837, 
  0.19673872, 0.91495067, 
  0.8169521, 0.9756134,*/

};

Vector<SceneData> g_SceneData = new Vector<SceneData>();

boolean g_Restart = false;

void keyPressed()
{
  if (key == 'h')
    g_PrintHelp ^= true;
  if (key == 's')
    g_PrintStats ^= true;
  if (key == 't')
  {
    g_ShowTiles ^= 1;
    g_Restart = true;
  }
  if (key == 'r')
  {
    g_UseReflection ^= true;
    g_Restart = true;
  }
  if (key == 'n')
  {
    g_ShowNormals ^= true;
    g_Restart = true;
  }
  if (key == 'g')
  {
    g_UseRefraction ^= true;
    g_Restart = true;
  }
  if (key == 'c')
  {
    g_UseIBL ^= true;
    g_Restart = true;
    g_IrradianceCache._flush();
  }
  if (key == '+' || key == '=')
  {
    println("\n=============================\nGoing to next scene...\n=============================\n");
    g_NextScene++;
    g_NextScene %= g_SceneData.size();
    g_Restart = true;
  }
  if (key == '-')
  {
    println("\n=============================\nGoing to previous scene...\n=============================\n");
    g_NextScene--;
    if (g_NextScene < 0)
      g_NextScene = g_SceneData.size() - 1;
    g_Restart = true;
  }
}

void draw()
{
  //
  if (g_Restart)
  {
    g_Restart = false;
    g_AccFrameCount=0;
    for (int i = 0; i < g_DeepestNodes.length; i++)
      g_DeepestNodes[i] = null;
  }

  if (g_CurrentScene != g_NextScene)
  {
    g_CurrentScene = g_NextScene;
    g_Scene._shutdown();
    g_IrradianceCache._flush();
    g_Scene._init( g_SceneData.get(g_NextScene) );
    g_IrradianceCache.setSceneSize( g_Scene.mSceneSize );
  }
  
  int jx = (g_AccFrameCount * 2) % _jitters.length;
  int jy = (g_AccFrameCount * 2 + 1) % _jitters.length;
  float jitterX = _jitters[jx];
  float jitterY = _jitters[jy];

  g_FrameTime = 0;
  g_IntersectTime = 0;
  g_CopyTime = 0;
  g_DiffuseTime = 0;
  g_ReflectTime = 0;
  g_DirectTime = 0;
  g_TriAccelTime = 0;
  g_SkyTime = 0;
  
//  rand.setSeed(g_AccFrameCount);
  
  // Farm out the render tasks.  
  if (g_Workers._isFinished())
  {
    
    g_FrameTime = millis();
    
    for (int y = 0; y < g_TilesAcross; y++)
    {
      for (int x = 0; x < g_TilesAcross; x++)
      {
        RayTracerTile tile = new RayTracerTile();
        tile.mTileX = x;
        tile.mTileY = y;
        tile.mJitterX = jitterX;
        tile.mJitterY = jitterY;
        tile.mScene = g_Scene;
        tile.mTileWidth = g_TileWidth;
        tile.mTileHeight = g_TileHeight; 
        g_Workers._addToQueue(tile);  // Add the render tile runnable to the worker queue.
      }
    }

    while (!g_Workers._isFinished ())
      ;
      
    g_AccFrameCount++;
    
    g_CopyTime = millis();
    
    final float m = 1.0f / (float)g_AccFrameCount;

    // Copy to frame buffer and tone map.
    for (int y = 0; y < g_FrameHeight; y++)
    {
      for (int x = 0; x < g_FrameHeight; x++)
      {
        int formula = (y * g_FrameHeight + x) * 3;
        
        int r = int(sqrt(g_Picture[formula] * m) * 255.0f);
        int g = int(sqrt(g_Picture[formula+1] * m) * 255.0f);
        int b = int(sqrt(g_Picture[formula+2] * m) * 255.0f);

        color pixel = color(r, g, b);

        g_FrameBuffer.pixels[y * g_FrameHeight + x] = pixel;
      }
    }

    background(g_FrameBuffer);
    
    g_CopyTime = millis() - g_CopyTime;

    // Stats
    g_FrameTime = millis() - g_FrameTime;

    if (g_Profile > 0)
      println("milliseconds: frame " + g_FrameTime + ", triaccel " + g_TriAccelTime + ", intersect " + g_IntersectTime + ", copy " + g_CopyTime + ", diffuse " + g_DiffuseTime + ", reflect " + g_ReflectTime + ", direct " + g_DirectTime + ", sky " + g_SkyTime);

    g_FrameCount++;

    if (g_PrintHelp)
    {
      fill(255,255,255);
      text(
      "Mouse left button drag: rotate camera\n" +
      "Mouse right button drag: move camera\n\n" +
//      "CTRL + mouse left button drag: move light source\n" +
//      "CTRL + mouse right button drag: resize/raise/lower light source\n\n" +
      "'+' go to next scene\n" +
      "'-' go to previous scene\n\n" +
      "'R' toggle reflection\n" +
      "'C' toggle cube map\n" +
      "'H' toggle help message\n" +
      "'S' toggle stats\n" +
      "'G' toggle glass (refraction)\n" +
      "'N' toggle normal rendering\n" +
      "'T' show thread tiles\n"
      , 10, height/3);
    }

    if (g_PrintStats)
    {
      fill(255,255,255);
      text("v.beta 'H' key for help. Frame " + g_AccFrameCount + ", time " + g_FrameTime + ", threads " + g_ThreadCount, 10, height - 16);
    }
  }
}


public class WorkQueue
{
  private final int mThreadCount;
  private final WorkerThread[] mThreads;
  private final LinkedList mQueue;

  public WorkQueue(int threadCount)
  {
    mThreadCount = threadCount;
    mQueue = new LinkedList();
    mThreads = new WorkerThread[threadCount];

    for (int i = 0; i < threadCount; i++)
    {
      mThreads[i] = new WorkerThread();
      mThreads[i].mThreadNumber = i;
      mThreads[i].start();
    }
  }

  public boolean _isFinished()
  {
    for (int i = 0; i < mThreads.length; i++)
    {
      if (mThreads[i].mWorking)
        return false;
    }
    return mQueue.isEmpty();
  }

  public void _addToQueue(Runnable r)
  {
    synchronized(mQueue)
    {
      mQueue.addLast(r);
      mQueue.notify();
    }
  }


  private class WorkerThread extends Thread
  {
    boolean    mWorking = false;
    int        mThreadNumber;

    // There's maybe 8 or more of these worker threads running together, listening to the queue and
    // running the runnables as they are added to the queue.
    public void run()
    {
      mWorking = true;
      Runnable r;

      while (true)
      {
        synchronized (mQueue)
        {
          while (mQueue.isEmpty ())
          {
            //                        println("WorkerThread " + mThreadNumber + " is waiting");
            mWorking = false;

            try {
              mQueue.wait();
            }
            catch (InterruptedException e) {
            }
          }

          // We found something in the queue, so claim it.
          mWorking = true;
          //                    println("WorkerThread " + mThreadNumber + " is working");
          r = (Runnable) mQueue.removeFirst();
        }

        try {
          // Run the runnable thing that we just got from the queue.
          r.run();
        }
        catch (RuntimeException e) {
          println("TASK ERROR" + e);  // The pool could leak threads.
        }
      }
    }
  }
}

final int[] _domToFace = { 1,4,0, 3,5,2 };  // +x+y+z-x-y-z

final int[] _faceToAxes = {
  // u,v,dominant
  0,1,2,
  2,1,0,
  0,1,2,
  2,1,0,
  0,2,1,
  0,2,1,
};

final float[] _faceToUv = {
 // center of faces 
  3.0f/6.0f, 3.0f/8.0f,
  5.0f/6.0f, 3.0f/8.0f,
  3.0f/6.0f, 7.0f/8.0f,
  1.0f/6.0f, 3.0f/8.0f,
  3.0f/6.0f, 1.0f/8.0f,
  3.0f/6.0f, 5.0f/8.0f,
};

final float[] _uvScale = {
  // division is to map to the cube network
   1.0/6.0, -1.0/8.0,
  -1.0/6.0, -1.0/8.0,
   1.0/6.0,  1.0/8.0,
   1.0/6.0, -1.0/8.0,
   1.0/6.0,  1.0/8.0,
   1.0/6.0, -1.0/8.0,
};

// Returns [-1,1] for u and v
PVector _cubify(float sx, float sy, float sz)  // cubeify?
{
  float x = sx;  // 0.7071
  float y = sy;  // 0
  float z = sz;  // 0.7071
//  float d = sz < 0 ? -1.0f : 1.0f;  // 1
//  float w = z / d;  // 0.7071
  float w = sz < 0.0f ? -z : z;
  float oow = 1.0f / w;  // 1.414
  PVector uvOut = new PVector();
  uvOut.x = x * oow;  // 1
  uvOut.y = y * oow;  // 0
  return uvOut;
}
