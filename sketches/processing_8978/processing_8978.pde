
public class Cube
{
  //<editor-fold defaultstate="collapsed" desc="Fields">

  private byte[] faces;
  Solution solution;
  Solution completedSolution = null;
  int playcount = 0;
  String lastMovePlayed = "";
  public void play()
  {
    if (playcount == completedSolution.solution.size()) 
    {
      completedSolution = null;
      lastMovePlayed = "";
      //println("\t" + this + "\tCube Solved");
    }
    if (completedSolution != null){
      //println((playcount + 1) + "\t" + this + "\t" + moves[(Byte)completedSolution.solution.get(playcount)] + "\t" + (Byte)completedSolution.solution.get(playcount));
      //print(moves[(Byte)completedSolution.solution.get(playcount)] + " ");
      move((byte)0,(Byte)completedSolution.solution.get(playcount));
      lastMovePlayed = moves[(Byte)completedSolution.solution.get(playcount)];
      playcount++;
    }
  }
  //</editor-fold>
  // <editor-fold defaultstate="collapsed" desc="Data">
  final String[] moves =
  {
    "U", "U2", "U'",
    "D", "D2", "D'",
    "L", "L2", "L'",
    "R", "R2", "R'",
    "F", "F2", "F'",
    "B", "B2", "B'"
  };
  final byte[][][] edges = new byte[][][]
  {
    {
      {
        1, 16
      }
      ,
      {
        5, 39
      }
      ,
      {
        7, 19
      }
      ,
      {
        3, 32
      }
    }
    ,
    {
      {
        10, 46
      }
      ,
      {
        14, 37
      }
      ,
      {
        16, 1
      }
      ,
      {
        12, 28
      }
    }
    ,
    {
      {
        19, 7
      }
      ,
      {
        23, 43
      }
      ,
      {
        25, 52
      }
      ,
      {
        21, 34
      }
    }
    ,
    {
      {
        28, 12
      }
      ,
      {
        32, 3
      }
      ,
      {
        34, 21
      }
      ,
      {
        30, 50
      }
    }
    ,
    {
      {
        37, 14
      }
      ,
      {
        41, 48
      }
      ,
      {
        43, 23
      }
      ,
      {
        39, 5
      }
    }
    ,
    {
      {
        46, 10
      }
      ,
      {
        50, 30
      }
      ,
      {
        52, 25
      }
      ,
      {
        48, 41
      }
    }
  };
  final byte[][][] corners = new byte[][][]
  {
    {
      {
        2, 36, 17
      }
      ,
      {
        8, 42, 20
      }
      ,
      {
        6, 35, 18
      }
      ,
      {
        0, 29, 15
      }
    }
    ,
    {
      {
        11, 38, 45
      }
      ,
      {
        17, 36, 2
      }
      ,
      {
        15, 29, 0
      }
      ,
      {
        9, 27, 47
      }
    }
    ,
    {
      {
        20, 42, 8
      }
      ,
      {
        26, 44, 51
      }
      ,
      {
        24, 33, 53
      }
      ,
      {
        18, 35, 6
      }
    }
    ,
    {
      {
        29, 0, 15
      }
      ,
      {
        35, 6, 18
      }
      ,
      {
        33, 53, 24
      }
      ,
      {
        27, 47, 9
      }
    }
    ,
    {
      {
        38, 45, 11
      }
      ,
      {
        44, 51, 26
      }
      ,
      {
        42, 8, 20
      }
      ,
      {
        36, 2, 17
      }
    }
    ,
    {
      {
        47, 27, 9
      }
      ,
      {
        53, 33, 24
      }
      ,
      {
        51, 44, 26
      }
      ,
      {
        45, 38, 11
      }
    }
  };
  final byte[][] edgePairings = new byte[][]
  {
    {
      1, 4, 2, 3
    }
    ,
    {
      5, 4, 0, 3
    }
    ,
    {
      0, 4, 5, 3
    }
    ,
    {
      1, 0, 2, 5
    }
    ,
    {
      1, 5, 2, 0
    }
    ,
    {
      1, 3, 2, 4
    }
  };
  final byte[][][] cornerPairings = new byte[][][]
  {
    {
      {
        0, 4, 1
      }
      ,
      {
        0, 4, 2
      }
      ,
      {
        0, 3, 2
      }
      ,
      {
        0, 3, 1
      }
    }
    ,
    {
      {
        1, 4, 5
      }
      ,
      {
        1, 4, 0
      }
      ,
      {
        1, 3, 0
      }
      ,
      {
        1, 3, 5
      }
    }
    ,
    {
      {
        2, 4, 0
      }
      ,
      {
        2, 4, 5
      }
      ,
      {
        2, 3, 5
      }
      ,
      {
        2, 3, 0
      }
    }
    ,
    {
      {
        3, 0, 1
      }
      ,
      {
        3, 0, 2
      }
      ,
      {
        3, 5, 2
      }
      ,
      {
        3, 5, 1
      }
    }
    ,
    {
      {
        4, 5, 1
      }
      ,
      {
        4, 5, 2
      }
      ,
      {
        4, 0, 2
      }
      ,
      {
        4, 0, 1
      }
    }
    ,
    {
      {
        5, 3, 1
      }
      ,
      {
        5, 3, 2
      }
      ,
      {
        5, 4, 2
      }
      ,
      {
        5, 4, 1
      }
    }
  };

  // </editor-fold>
  // <editor-fold defaultstate="collapsed" desc="Constructor">
  public Cube()
  {
    resetCube();
    solution = null;
  }

  public void resetCube()
  {
    faces = new byte[]
    {
      0, 0, 0, 0, 0, 0, 0, 0, 0,
      1, 1, 1, 1, 1, 1, 1, 1, 1,
      2, 2, 2, 2, 2, 2, 2, 2, 2,
      3, 3, 3, 3, 3, 3, 3, 3, 3,
      4, 4, 4, 4, 4, 4, 4, 4, 4,
      5, 5, 5, 5, 5, 5, 5, 5, 5
    };
  }
  //</editor-fold>

  //<editor-fold defaultstate="collapsed" desc="Face Turns">
  public void fi()
  {
    swap(0, 6);
    swap(1, 3);
    swap(2, 0);
    swap(2, 8);
    swap(1, 7);
    swap(1, 5);
    swap(15, 35);
    swap(16, 32);
    swap(17, 29);
    swap(17, 18);
    swap(16, 19);
    swap(15, 20);
    swap(36, 15);
    swap(39, 16);
    swap(42, 17);

    if (solution != null)
    {
      solution.addMove((byte) 14);
    }
  }

  public void f()
  {
    fi();
    fi();
    fi();
  }

  public void f2()
  {
    fi();
    fi();
  }

  public void ui()
  {
    swap(9, 15);
    swap(10, 12);
    swap(11, 9);
    swap(11, 17);
    swap(10, 16);
    swap(10, 14);
    swap(47, 29);
    swap(46, 28);
    swap(45, 27);
    swap(45, 0);
    swap(46, 1);
    swap(47, 2);
    swap(38, 47);
    swap(37, 46);
    swap(36, 45);

    if (solution != null)
    {
      solution.addMove((byte) 2);
    }
  }

  public void u()
  {
    ui();
    ui();
    ui();
  }

  public void u2()
  {
    ui();
    ui();
  }

  public void di()
  {
    swap(18, 24);
    swap(19, 21);
    swap(20, 18);
    swap(20, 26);
    swap(19, 25);
    swap(19, 23);
    swap(6, 33);
    swap(7, 34);
    swap(8, 35);
    swap(8, 53);
    swap(7, 52);
    swap(6, 51);
    swap(42, 6);
    swap(43, 7);
    swap(44, 8);

    if (solution != null)
    {
      solution.addMove((byte) 5);
    }
  }

  public void d()
  {
    di();
    di();
    di();
  }

  public void d2()
  {
    di();
    di();
  }

  public void bi()
  {
    swap(45, 51);
    swap(46, 48);
    swap(47, 45);
    swap(47, 53);
    swap(46, 52);
    swap(46, 50);
    swap(11, 44);
    swap(10, 41);
    swap(9, 38);
    swap(9, 26);
    swap(10, 25);
    swap(11, 24);
    swap(27, 11);
    swap(30, 10);
    swap(33, 9);

    if (solution != null)
    {
      solution.addMove((byte) 17);
    }
  }

  public void b()
  {
    bi();
    bi();
    bi();
  }

  public void b2()
  {
    bi();
    bi();
  }

  public void li()
  {
    swap(27, 33);
    swap(28, 30);
    swap(29, 27);
    swap(29, 35);
    swap(28, 34);
    swap(28, 32);
    swap(9, 53);
    swap(12, 50);
    swap(15, 47);
    swap(15, 24);
    swap(12, 21);
    swap(9, 18);
    swap(0, 9);
    swap(3, 12);
    swap(6, 15);

    if (solution != null)
    {
      solution.addMove((byte) 8);
    }
  }

  public void l()
  {
    li();
    li();
    li();
  }

  public void l2()
  {
    li();
    li();
  }

  public void ri()
  {
    swap(36, 42);
    swap(37, 39);
    swap(38, 36);
    swap(38, 44);
    swap(37, 43);
    swap(37, 41);
    swap(17, 8);
    swap(14, 5);
    swap(11, 2);
    swap(11, 20);
    swap(14, 23);
    swap(17, 26);
    swap(45, 17);
    swap(48, 14);
    swap(51, 11);

    if (solution != null)
    {
      solution.addMove((byte) 11);
    }
  }

  public void r()
  {
    ri();
    ri();
    ri();
  }

  public void r2()
  {
    ri();
    ri();
  }
  //</editor-fold>

  // <editor-fold defaultstate="collapsed" desc="Getters">
  public byte[] getFace(int face)
  {
    byte[] facecolors = new byte[9];
    for (int i = 0; i < 9; i++)
    {
      facecolors[i] = faces[face * 9 + i];
    }
    return facecolors;
  }

  public byte[] getEdgeFaces(int face, int edge)
  {
    return new byte[]
    {
      faces[edges[face][edge][0]], faces[edges[face][edge][1]]
    };
  }

  public byte[] getCornerFaces(int face, int corner)
  {
    return new byte[]
    {
      faces[corners[face][corner][0]], faces[corners[face][corner][1]], faces[corners[face][corner][2]]
    };
  }
  // </editor-fold>

  //<editor-fold defaultstate="collapsed" desc="Algorithm Translator">
  public void move(int face, int move)
  {
    switch (move)
    {
    case 0:
      switch (face)
      {
      case 0:
      case 3:
      case 4:
      case 5:
        u();
        break;
      case 1:
        b();
        break;
      case 2:
        f();
        break;
      }
      break;
    case 1:
      switch (face)
      {
      case 0:
      case 3:
      case 4:
      case 5:
        u2();
        break;
      case 1:
        b2();
        break;
      case 2:
        f2();
        break;
      }
      break;
    case 2:
      switch (face)
      {
      case 0:
      case 3:
      case 4:
      case 5:
        ui();
        break;
      case 1:
        bi();
        break;
      case 2:
        fi();
        break;
      }
      break;
    case 3:
      switch (face)
      {
      case 0:
      case 3:
      case 4:
      case 5:
        d();
        break;
      case 1:
        f();
        break;
      case 2:
        b();
        break;
      }
      break;
    case 4:
      switch (face)
      {
      case 0:
      case 3:
      case 4:
      case 5:
        d2();
        break;
      case 1:
        f2();
        break;
      case 2:
        b2();
        break;
      }
      break;
    case 5:
      switch (face)
      {
      case 0:
      case 3:
      case 4:
      case 5:
        di();
        break;
      case 1:
        fi();
        break;
      case 2:
        bi();
        break;
      }
      break;
    case 6:
      switch (face)
      {
      case 0:
      case 1:
      case 2:
        l();
        break;
      case 5:
        r();
        break;
      case 3:
        b();
        break;
      case 4:
        f();
        break;
      }
      break;
    case 7:
      switch (face)
      {
      case 0:
      case 1:
      case 2:
        l2();
        break;
      case 5:
        r2();
        break;
      case 3:
        b2();
        break;
      case 4:
        f2();
        break;
      }
      break;
    case 8:
      switch (face)
      {
      case 0:
      case 1:
      case 2:
        li();
        break;
      case 5:
        ri();
        break;
      case 3:
        bi();
        break;
      case 4:
        fi();
        break;
      }
      break;
    case 9:
      switch (face)
      {
      case 0:
      case 1:
      case 2:
        r();
        break;
      case 5:
        l();
        break;
      case 3:
        f();
        break;
      case 4:
        b();
        break;
      }
      break;
    case 10:
      switch (face)
      {
      case 0:
      case 1:
      case 2:
        r2();
        break;
      case 5:
        l2();
        break;
      case 3:
        f2();
        break;
      case 4:
        b2();
        break;
      }
      break;
    case 11:
      switch (face)
      {
      case 0:
      case 1:
      case 2:
        ri();
        break;
      case 5:
        li();
        break;
      case 3:
        fi();
        break;
      case 4:
        bi();
        break;
      }
      break;
    case 12:
      switch (face)
      {
      case 0:
        f();
        break;
      case 1:
        u();
        break;
      case 2:
        d();
        break;
      case 3:
        l();
        break;
      case 4:
        r();
        break;
      case 5:
        b();
        break;
      }
      break;
    case 13:
      switch (face)
      {
      case 0:
        f2();
        break;
      case 1:
        u2();
        break;
      case 2:
        d2();
        break;
      case 3:
        l2();
        break;
      case 4:
        r2();
        break;
      case 5:
        b2();
        break;
      }
      break;
    case 14:
      switch (face)
      {
      case 0:
        fi();
        break;
      case 1:
        ui();
        break;
      case 2:
        di();
        break;
      case 3:
        li();
        break;
      case 4:
        ri();
        break;
      case 5:
        bi();
        break;
      }
      break;
    case 15:
      switch (face)
      {
      case 0:
        b();
        break;
      case 1:
        d();
        break;
      case 2:
        u();
        break;
      case 3:
        r();
        break;
      case 4:
        l();
        break;
      case 5:
        f();
        break;
      }
      break;
    case 16:
      switch (face)
      {
      case 0:
        b2();
        break;
      case 1:
        d2();
        break;
      case 2:
        u2();
        break;
      case 3:
        r2();
        break;
      case 4:
        l2();
        break;
      case 5:
        f2();
        break;
      }
      break;
    case 17:
      switch (face)
      {
      case 0:
        bi();
        break;
      case 1:
        di();
        break;
      case 2:
        ui();
        break;
      case 3:
        ri();
        break;
      case 4:
        li();
        break;
      case 5:
        fi();
        break;
      }
      break;
    }
  }

  public void performAlgorithm(byte face, byte[] algorithm)
  {
    for (int i = 0; i < algorithm.length; i++)
    {
      move(face, algorithm[i]);
    }
  }
  //</editor-fold>

  //<editor-fold defaultstate="collapsed" desc="Solver">
  public void solve()
  {
    byte[] state = faces.clone();
    solution = new Solution();
    solveBottomCross();
    solveBottomCorners();
    solveMiddleEdges();
    solveUpperCross();
    solveUpperCorners();
    solution.end();
    faces = state;
    completedSolution = solution;
    playcount = 0;
    solution = null;
    solutionlength=completedSolution.solution.size();
  }
  //</editor-fold>

  //<editor-fold defaultstate="collapsed" desc="Upper Corners">
  public void solveUpperCorners()
  {
    int permutedcorner = findPermutedCorner();
    while (permutedcorner == -1)
    {
      performAlgorithm((byte)0,new byte[]{
        0,9,2,8,0,11,2,6
      }
      );
      permutedcorner = findPermutedCorner();
    }
    permuteAllUpperCorners(permutedcorner);
    orientUpperCorners();
  }

  public void orientUpperCorners()
  {
    for (int i = 0; i < 4; i++)
    {
      byte[] cornerfaces = getCornerFaces(0,0);
      if (cornerfaces[0] == 1)
      {
        performAlgorithm((byte)0,new byte[]{
          5,11,3,9,5,11,3,9
        }
        );
      }
      else if (cornerfaces[1] == 1)
      {
        performAlgorithm((byte)0,new byte[]{
          11,5,9,3,11,5,9,3
        }
        );
      }
      move(0,2);
    }
  }

  public void permuteAllUpperCorners(int face)
  {
    byte[] topleftgoodcolors = cornerPairings[face][3];
    byte[] topleftcolors = getCornerFaces(face,3);

    byte counter = 0;
    for (int i = 0; i < 3; i++)
    {
      if (contains(topleftcolors,topleftgoodcolors[i])) counter++;
    }

    if (counter == 1)
    {
      performAlgorithm((byte)face,new byte[]{
        0,9,2,8,0,11,2,6
      }
      );
    }
    if (counter == 2)
    {
      performAlgorithm((byte)face,new byte[]{
        8,0,9,2,6,0,11,2
      }
      );
    }
  }

  public int findPermutedCorner()
  {
    for (int i = 0; i < 4; i++)
    {
      byte[] colors = cornerPairings[1][i];
      byte[] cornercolors = getCornerFaces(1,i);
      Arrays.sort(colors);
      Arrays.sort(cornercolors);

      if ((colors[0] == cornercolors[0]) &&(colors[1] == cornercolors[1]) &&(colors[2] == cornercolors[2]))
      {
        return edgePairings[1][(i+1)%4];
      }
    }
    return -1;
  }

  //</editor-fold>

  //<editor-fold defaultstate="collapsed" desc="Upper Cross">
  public void solveUpperCross()
  {
    orientUpperCross();
    permuteUpperCross();
  }

  public void permuteUpperCross()
  {
    while(!checkUpperCrossPermuted())
    {
      checkOppositePermuted();
      checkAdjacentPermuted();
      move(0,0);
    }
  }

  byte[] algorithm = new byte[]{
    9,0,11,0,9,1,11
  };
  public void checkAdjacentPermuted()
  {
    for (int i = 0; i < 4; i++)
    {
      if((getEdgeFaces(1,i)[1] == edgePairings[1][i])&&(getEdgeFaces(1,(i+3)%4)[1] == edgePairings[1][(i+3)%4]))
      {
        performAlgorithm(edgePairings[1][(i+1)%4],algorithm);
        break;
      }
    }
  }

  public void checkOppositePermuted()
  {
    if ((getEdgeFaces(1,0)[1] == edgePairings[1][0]) && (getEdgeFaces(1,2)[1] == edgePairings[1][2]))
    {
      performAlgorithm((byte)0,algorithm);
    }
    if ((getEdgeFaces(1,1)[1] == edgePairings[1][1]) && (getEdgeFaces(1,3)[1] == edgePairings[1][3]))
    {
      performAlgorithm((byte)0,algorithm);
    }    
  }

  public boolean checkUpperCrossPermuted()
  {
    if ((getEdgeFaces(1,0)[1] != edgePairings[1][0])||
      (getEdgeFaces(1,1)[1] != edgePairings[1][1])||
      (getEdgeFaces(1,2)[1] != edgePairings[1][2])||
      (getEdgeFaces(1,3)[1] != edgePairings[1][3]))
      return false;
    else
      return true;
  }

  public void orientUpperCross()
  {
    byte pattern = getPatternOnUpFace();
    switch (pattern)
    {
    case 0x0:
      solveLine(0);
      solveL(5);
      break;
    case 0x3:
      solveL(0);
      break;
    case 0x5:
      solveL(3);
      break;
    case 0xC:
      solveL(5);
      break;
    case 0xA:
      solveL(4);
      break;
    case 0x9:
      solveLine(4);
      break;
    case 0x6:
      solveLine(0);
      break;
    case 0xF:
      break;
    }
  }
  
  public void solveL(int face)
  {
    performAlgorithm((byte)face,new byte[]{
      12, 0, 9, 2, 11, 14
    }
    );
  }

  public void solveLine(int face)
  {
    performAlgorithm((byte)face,new byte[]
    {
      12, 9, 0, 11, 2, 14                                                  
    }
    );
  }
  
  public byte getPatternOnUpFace()
  {
    byte[] face = getFace(1);
    byte inc = 1;
    byte res = 0;
    if (face[1] == 1) res |= 1;
    if (face[3] == 1) res |= 2;
    if (face[5] == 1) res |= 4;
    if (face[7] == 1) res |= 8;    
    return res;
  }
  //</editor-fold>

  //<editor-fold defaultstate="collapsed" desc="Bottom Cross">
  public void solveBottomCross()
  {
    permuteBottomCross();
    orientBottomCross();
  }

  public void orientBottomCross()
  {
    for (int i = 0; i < 4; i++)
    {
      byte[] edgeFaces = getEdgeFaces(2, i);
      if (edgeFaces[0] == 2)
      {
        continue;
      }

      performAlgorithm(edgePairings[2][i], new byte[]
      {
        14, 3, 11, 5
      }
      );
    }
  }

  private void permuteBottomCross()
  {
    int status = checkBottomCrossPermutation();
    while (status != -1)
    {
      byte sideface = edgePairings[2][status];
      byte[] facePosition = findEdge((byte) 2, sideface);
      moveToTop(facePosition);

      facePosition = findEdge((byte) 2, sideface);
      if (facePosition[0] != 1)
      {
        for (byte i = 0; i < 4; i++)
        {
          if (edgePairings[1][i] == facePosition[0])
          {
            facePosition[1] = i;
            facePosition[0] = 1;
            break;
          }
        }
      }

      moveIntoCorrectPosition(facePosition);
      status = checkBottomCrossPermutation();
    }
  }

  private void moveToTop(byte[] facepos)
  {
    if (facepos[0] == 2)
    {
      facepos[0] = edgePairings[2][facepos[1]];
      facepos[1] = 2;
    }

    if (facepos[0] == 1)
    {
      facepos[0] = edgePairings[1][facepos[1]];
      facepos[1] = 0;
    }

    switch (facepos[1])
    {
    case 0:
      break;
    case 1:
      performAlgorithm(facepos[0], new byte[]
      {
        14, 0, 12
      }
      );
      break;
    case 2:
      move(facepos[0], 13);
      break;
    case 3:
      performAlgorithm(facepos[0], new byte[]
      {
        12, 0, 14
      }
      );
      break;
    }
  }

  private void moveIntoCorrectPosition(byte[] pos)
  {
    byte[] edgeFaces = getEdgeFaces(pos[0], pos[1]);
    byte edgepos;
    if (edgeFaces[0] == 2)
    {
      edgepos = edgeFaces[1];
    } 
    else
    {
      edgepos = edgeFaces[0];
    }

    while (edgepos != edgePairings[1][pos[1]])
    {
      move(1, 12);
      pos[1] = (byte) ((pos[1] + 1) % 4);
    }

    if (edgeFaces[0] == 2)
    {
      move(edgePairings[1][pos[1]], 13);
    }
    else
    {
      performAlgorithm(edgePairings[1][pos[1]],new byte[]{
        12,3,11,5
        }
      );
    }
  }

  private int checkBottomCrossPermutation()
  {
    int ret = -1;

    for (int i = 0; i < 4; i++)
    {
      byte[] edge = getEdgeFaces(2, i);
      if (!(((edge[0] == 2) && (edge[1] == edgePairings[2][i])) || ((edge[0] == edgePairings[2][i]) && (edge[1] == 2))))
      {
        byte[] pos = findEdge((byte)2,edgePairings[2][i]);

        if (pos[0] == 1)
        {
          pos[0] = edgePairings[1][pos[1]];
          pos[1] = 0;
        }
        if (pos[0] == 2)
        {
          pos[0] = edgePairings[2][pos[1]];
          pos[1] = 2;
        }
        if (pos[1] == 0)
        {
          return i;
        }
        ret = i;
      }
    }
    return ret;
  }
  //</editor-fold>

  //<editor-fold defaultstate="collapsed" desc="Bottom Corners">
  public void solveBottomCorners()
  {
    int status = checkBottomCorners();

    while (status != -1)
    {
      byte[] cornerpos = findCornerOnSideFace(cornerPairings[2][status]);

      if ((cornerpos[1] == 1) || (cornerpos[1] == 2))
      {
        if (cornerpos[1] == 2)
        {
          cornerpos[0] = edgePairings[cornerpos[0]][3];
          cornerpos[1] = 1;
        }
        performAlgorithm(cornerpos[0], new byte[]
        {
          9, 0, 11
        }
        );
      }

      cornerpos = findCornerOnTopFace(cornerPairings[2][status]);
      while (!checkAboveCorrectPosition(cornerpos))
      {
        move(1, 12);
        cornerpos[1] = (byte) ((cornerpos[1] + 1) % 4);
      }

      insertBottomCorner(findCornerOnSideFace(cornerPairings[2][status]));
      status = checkBottomCorners();
    }
  }

  public int checkBottomCorners()
  {
    int ret = -1;
    boolean upfound = false;

    for (int i = 0; i < 4; i++)
    {
      boolean solved = false;
      switch(i)
      {
      case 0:
        solved = checkBottomRightCornerSolved(0);
        break;
      case 1:
        solved = checkBottomRightCornerSolved(4);
        break;
      case 2:
        solved = checkBottomRightCornerSolved(5);
        break;
      case 3:
        solved = checkBottomRightCornerSolved(3);
        break;
      }

      if (!solved)
      {
        byte[] pos = findCornerOnSideFace(cornerPairings[2][i]);
        boolean isOnBottom = ((pos[1] == 1) || (pos[1] == 2));
        if (isOnBottom)
        {
          if (!upfound) ret = i;
        }
        else
        {
          byte[] cornerfaces = getCornerFaces(pos[0],pos[1]);
          if (cornerfaces[2] != 2) return i;

          upfound = true;
          ret = i;
        }
      }
    }
    return ret;
  }

  public boolean checkBottomRightCornerSolved(int face)
  {
    byte[] cornerFaces = getCornerFaces(face, 1);
    if (cornerFaces[0] != face)
    {
      return false;
    }
    if (cornerFaces[1] != edgePairings[face][1])
    {
      return false;
    }
    if (cornerFaces[2] != edgePairings[face][2])
    {
      return false;
    }
    return true;
  }

  public void insertBottomCorner(byte[] cornerpos)
  {
    if (cornerpos[1] == 3)
    {
      cornerpos[0] = edgePairings[cornerpos[0]][3];
      cornerpos[1] = 0;
    }

    byte[] cornerfaces = getCornerFaces(cornerpos[0], cornerpos[1]);

    if (cornerfaces[0] == 2)
    {
      performAlgorithm(cornerpos[0], new byte[]
      {
        0, 9, 2, 11
      }
      );
      return;
    }
    if (cornerfaces[1] == 2)
    {
      performAlgorithm(cornerpos[0], new byte[]
      {
        2, 14, 0, 12
      }
      );
      return;
    }
    if (cornerfaces[2] == 2)
    {
      performAlgorithm(cornerpos[0], new byte[]
      {
        14, 1, 12, 1, 9, 2, 11
      }
      );
      return;
    }
  }

  public boolean checkAboveCorrectPosition(byte[] cornerpos)
  {
    byte[] cornerfaces = getCornerFaces(cornerpos[0], cornerpos[1]);
    Arrays.sort(cornerfaces);

    if (!contains(cornerfaces, edgePairings[1][cornerpos[1]]))
    {
      return false;
    } 
    else if (!contains(cornerfaces, edgePairings[1][(cornerpos[1] + 1) % 4]))
    {
      return false;
    } 
    else
    {
      return true;
    }
  }
  //</editor-fold>

  //<editor-fold defaultstate="collapsed" desc="Middle Edges">
  private void solveMiddleEdges()
  {
    int status = checkMiddleEdges();
    while (status != -1)
    {
      byte[] edgepos = findEdge(edgePairings[1][status], edgePairings[1][(status + 3) % 4]);
      byte[] edgefaces = getEdgeFaces(edgepos[0], edgepos[1]);
      if ((edgepos[0] != 1) && ((edgepos[1] == 1) || (edgepos[1] == 3)))
      {
        if (!checkSolvedWithBadOrientation(edgepos))
        {
          edgepos = findEdgeOnTopFace(edgefaces[0], edgefaces[1]);
          solveFromTop(edgepos);
        }
      } 
      else
      {
        edgepos = findEdgeOnTopFace(edgefaces[0], edgefaces[1]);
        solveFromTop(edgepos);
      }
      status = checkMiddleEdges();
    }
  }

  private void solveFromTop(byte[] edgepos)
  {
    while (!(getEdgeFaces(edgepos[0], edgepos[1])[1] == edgePairings[1][edgepos[1]]))
    {
      move(1, 12);
      edgepos[1] = (byte) ((edgepos[1] + 1) % 4);
    }

    edgepos[0] = edgePairings[1][edgepos[1]];
    edgepos[1] = 0;

    insertMiddleEdge(edgepos);
  }

  private void insertMiddleEdge(byte[] edgepos)
  {
    byte[] edgefaces = getEdgeFaces(edgepos[0], edgepos[1]);
    if (edgefaces[1] == edgePairings[edgepos[0]][3])
    {
      performAlgorithm(edgepos[0], new byte[]
      {
        2, 8, 0, 6, 0, 12, 2, 14
      }
      );
    } 
    else
    {
      performAlgorithm(edgepos[0], new byte[]
      {
        0, 9, 2, 11, 2, 14, 0, 12
      }
      );
    }
  }

  private boolean checkSolvedWithBadOrientation(byte[] edgepos)
  {
    if (edgepos[1] == 1)
    {
      edgepos[0] = edgePairings[edgepos[0]][1];
      edgepos[1] = 3;
    }

    byte[] edgefaces = getEdgeFaces(edgepos[0], edgepos[1]);

    if ((edgefaces[1] == edgepos[0]) && (edgefaces[0] == edgePairings[edgepos[0]][3]))
    {
      performAlgorithm(edgepos[0], new byte[]
      {
        8, 0, 6, 0, 12, 2, 14, 0, 8, 0, 6, 0, 12, 2, 14
      }
      );
      return true;
    } 
    else
    {
      performAlgorithm(edgepos[0], new byte[]
      {
        8, 0, 6, 0, 12, 2, 14
      }
      );
      return false;
    }
  }

  private int checkMiddleEdges()
  {
    int ret = -1;
    for (int i = 0; i < 4; i++)
    {
      byte[] edgefaces = getEdgeFaces(edgePairings[1][i], 1);
      if (!((edgefaces[0] == edgePairings[1][i]) && (edgefaces[1] == edgePairings[1][(i + 3) % 4])))
      {
        byte[] pos = findEdge(edgePairings[1][i],edgePairings[1][(i+3)%4]);
        if (pos[0] == 1)
        {
          pos[0] = edgePairings[1][pos[1]];
          pos[1] = 0;
        }

        if (pos[1] == 0) return i;
        ret = i;
      }
    }
    return ret;
  }
  //</editor-fold>

  //<editor-fold defaultstate="collapsed" desc="Search">
  public byte[] findCornerOnSideFace(byte[] cornerFaces)
  {
    Arrays.sort(cornerFaces);
    for (byte i = 0; i < 6; i++)
    {
      if ((i == 1) || (i == 2))
      {
        continue;
      }

      for (byte j = 0; j < 4; j++)
      {
        byte[] compare = getCornerFaces(i, j);
        Arrays.sort(compare);
        if ((cornerFaces[0] == compare[0]) && (cornerFaces[1] ==
          compare[1]) && (cornerFaces[2] == compare[2]))
        {
          return new byte[]
          {
            i, j
          };
        }
      }
    }
    return null;
  }

  public byte[] findCornerOnTopFace(byte[] cornerFaces)
  {
    Arrays.sort(cornerFaces);
    for (byte j = 0; j < 4; j++)
    {
      byte[] compare = getCornerFaces(1, j);
      Arrays.sort(compare);
      if ((cornerFaces[0] == compare[0]) && (cornerFaces[1] == compare[1]) && (cornerFaces[2] == compare[2]))
      {
        return new byte[]
        {
          1, j
        };
      }
    }
    return null;
  }

  public byte[] findEdgeOnTopFace(byte edge1, byte edge2)
  {
    if (edge2 < edge1)
    {
      byte temp = edge2;
      edge2 = edge1;
      edge1 = temp;
    }

    for (byte j = 0; j < 4; j++)
    {
      byte[] compare = getEdgeFaces(1, j);
      Arrays.sort(compare);
      if ((edge1 == compare[0]) && (edge2 == compare[1]))
      {
        return new byte[]
        {
          1, j
        };
      }
    }
    return null;
  }

  private byte[] findEdge(byte face1, byte face2)
  {
    for (int face = 0; face < 6; face++)
    {
      for (int edgepos = 0; edgepos < 4; edgepos++)
      {
        byte[] edge = getEdgeFaces(face, edgepos);
        if (((edge[0] == face1) && (edge[1] == face2)) || ((edge[0] == face2) && (edge[1] == face1)))
        {
          return new byte[]
          {
            (byte) face, (byte) edgepos
          };
        }
      }
    }
    return null;
  }
  //</editor-fold>

  //<editor-fold defaultstate="collapsed" desc="Tools">
  public String toString()
  {
    StringBuffer f = new StringBuffer();
    for (int i = 0; i < faces.length; i++)
    {
      f.append(faces[i]);
    }
    return f.toString();
  }

  public void parse(String in)
  {
    if (in.length() != 54)
    {
      return;
    }
    for (int i = 0; i < 54;i++)
    {
      faces[i] = Byte.parseByte(in.charAt(i)+"");
    }
    printCube(this);
  }
  
  public void swap(int a, int b)
  {
    byte t = faces[a];
    faces[a] = faces[b];
    faces[b] = t;
  }

  public boolean contains(byte[] vals, byte value)
  {
    for (int i = 0; i < vals.length; i++)
    {
      if (vals[i] == value)
      {
        return true;
      }
    }
    return false;
  }
  //</editor-fold>
}

