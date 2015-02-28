
int g_iFieldType = 0;

class Field
{
  String getDescription() {return "";}
  float getDistance(PVector vecPos) {return 0;}
}

class Field_CubePlusSpheres extends Field
{
  String getDescription() {return "Cube plus spheres";}
  float getDistance(PVector vecPos)
  {
    float fSphereDist1 = rmSphere(vecPos.x-5, vecPos.y, vecPos.z, 4);
    float fSphereDist2 = rmSphere(vecPos.x+5, vecPos.y, vecPos.z, 4);
    float fSphereDist3 = rmSphere(vecPos.x, vecPos.y-5, vecPos.z, 4);
    float fSphereDist4 = rmSphere(vecPos.x, vecPos.y+5, vecPos.z, 4);
    float fSphereDist5 = rmSphere(vecPos.x, vecPos.y, vecPos.z-5, 4);
    float fSphereDist6 = rmSphere(vecPos.x, vecPos.y, vecPos.z+5, 4);
    float fMinSphereDist = min(min(fSphereDist1, fSphereDist2, fSphereDist3), min(fSphereDist4, fSphereDist5, fSphereDist6));
    float fCubeDist = rmRoundedCube(vecPos.x, vecPos.y, vecPos.z, 6, 2);
    return min(fCubeDist, fMinSphereDist);
  }
};

class Field_CubeMinusSpheres extends Field
{
  String getDescription() {return "Cube minus spheres";}
  float getDistance(PVector vecPos)
  {
    float fSphereDist1 = rmSphere(vecPos.x-5, vecPos.y, vecPos.z, 4);
    float fSphereDist2 = rmSphere(vecPos.x+5, vecPos.y, vecPos.z, 4);
    float fSphereDist3 = rmSphere(vecPos.x, vecPos.y-5, vecPos.z, 4);
    float fSphereDist4 = rmSphere(vecPos.x, vecPos.y+5, vecPos.z, 4);
    float fSphereDist5 = rmSphere(vecPos.x, vecPos.y, vecPos.z-5, 4);
    float fSphereDist6 = rmSphere(vecPos.x, vecPos.y, vecPos.z+5, 4);
    float fMinSphereDist = min(min(fSphereDist1, fSphereDist2, fSphereDist3), min(fSphereDist4, fSphereDist5, fSphereDist6));
    float fCubeDist = rmRoundedCube(vecPos.x, vecPos.y, vecPos.z, 6, 2);
    return max(fCubeDist, -fMinSphereDist);
  }
};

class Field_SpheresMinusCube extends Field
{
  String getDescription() {return "Spheres minus cube";}
  float getDistance(PVector vecPos)
  {
    float fSphereDist1 = rmSphere(vecPos.x-5, vecPos.y, vecPos.z, 4);
    float fSphereDist2 = rmSphere(vecPos.x+5, vecPos.y, vecPos.z, 4);
    float fSphereDist3 = rmSphere(vecPos.x, vecPos.y-5, vecPos.z, 4);
    float fSphereDist4 = rmSphere(vecPos.x, vecPos.y+5, vecPos.z, 4);
    float fSphereDist5 = rmSphere(vecPos.x, vecPos.y, vecPos.z-5, 4);
    float fSphereDist6 = rmSphere(vecPos.x, vecPos.y, vecPos.z+5, 4);
    float fMinSphereDist = min(min(fSphereDist1, fSphereDist2, fSphereDist3), min(fSphereDist4, fSphereDist5, fSphereDist6));
    float fCubeDist = rmRoundedCube(vecPos.x, vecPos.y, vecPos.z, 6, 2);
    return max(-fCubeDist, fMinSphereDist);
  }
}

class Field_IntersectedSphereAndCube extends Field
{
  String getDescription() {return "Intersecting with cube grids";}
  float getDistance(PVector vecPos)
  {
    float fBaseGeometry = min(rmCube(vecPos.x-20, vecPos.y, vecPos.z, 6), rmSphere(vecPos.x-16, vecPos.y-4, vecPos.z-4, 7), rmSphere(vecPos.x+5, vecPos.y-5, vecPos.z, 10));

    float fGrid1 = rmRepeatedCubes(vecPos.x + 500, vecPos.y + 500 + g_fTime * 0.001, vecPos.z + 500, 3.3, 0.3);
    float f1 = min(fBaseGeometry + 1.0, max(fBaseGeometry, fGrid1));
    float fGrid2 = rmRepeatedCubes(vecPos.x + 200 + g_fTime * 0.001, vecPos.y + 300, vecPos.z + 400, 1.5, 1.5);
    float f2 = min(f1 + 1.0, max(f1, fGrid2));

    return f2;
  }
}

class Field_SphereWithVerticalNoiseBand extends Field
{
  String getDescription() {return "Sphere with vertical noise band";}
  float getDistance(PVector vecPos)
  {
    return rmSphere(vecPos.x, vecPos.y, vecPos.z, 10) + noise(500 + g_fTime * 0.0001 + vecPos.y * 0.25) * 2;
  }
}

class Field_NoisySphere extends Field
{
  String getDescription() {return "Noisy sphere";}
  float getDistance(PVector vecPos)
  {
    return rmSphere(vecPos.x, vecPos.y, vecPos.z, 10) + noise(500 + vecPos.x * 0.125, 500 + vecPos.y * 0.125, 500 + vecPos.z * 0.125) * 4;
  }
}

class Field_VeryNoisySphere extends Field
{
  String getDescription() {return "Very noisy sphere";}
  float getDistance(PVector vecPos)
  {
    return rmSphere(vecPos.x, vecPos.y, vecPos.z, 10) + noise(500 + vecPos.x * 0.5, 500 + vecPos.y * 0.5, 500 + vecPos.z * 0.5) * 4;
  }
}

class Field_TwistedCube extends Field
{
  String getDescription() {return "Twisted cube";}
  float getDistance(PVector vecPos)
  {
    float fAngle = vecPos.y * 0.125;
    float fCA = cos(fAngle);
    float fSA = sin(fAngle);
    float fRX = fCA * vecPos.x + fSA * vecPos.z;
    float fRZ = -fSA * vecPos.x + fCA * vecPos.z;
    return rmCube(fRX, vecPos.y, fRZ, 6);
  }
}

class Field_Cubes extends Field
{
  String getDescription() {return "Cube cloud";}
  Field_Cubes()
  {
    m_iNumCubes = 20;
    m_aCubes = new PVector[m_iNumCubes];
    for (int i = 0; i < m_iNumCubes; i++)
    {
      m_aCubes[i] = new PVector(random(-6, 6), random(-10, 10), random(-6, 6));
    }
  }
  int m_iNumCubes;
  PVector[] m_aCubes;
  float getDistance(PVector vecPos)
  {
    float fDist = 9999;
    for (int i = 0; i < m_iNumCubes; i++)
    {
      float fThisDist = rmCube(vecPos.x + m_aCubes[i].x, vecPos.y + m_aCubes[i].y, vecPos.z + m_aCubes[i].z, 3);
      fDist = min(fDist, fThisDist);
    }
    return fDist;
  }
}

Field[] g_aFieldTypes = {
  new Field_CubePlusSpheres(),
  new Field_CubeMinusSpheres(),
  new Field_SpheresMinusCube(),
  new Field_IntersectedSphereAndCube(),
  new Field_SphereWithVerticalNoiseBand(),
  new Field_NoisySphere(),
  new Field_VeryNoisySphere(),
  new Field_TwistedCube(),
  new Field_Cubes(),
};
Field g_currentFieldType = g_aFieldTypes[g_iFieldType];


