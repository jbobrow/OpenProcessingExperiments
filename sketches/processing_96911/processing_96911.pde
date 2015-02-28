
import java.util.concurrent.*;  

   

class Delaunay {  

   

    List<PVector> vertices;     // 与えられた点列  

    List<Tetrahedron> tetras;   // 四面体リスト  

   

    public List<Line> edges;  

   

    public List<Line> surfaceEdges;  

    public List<Triangle> triangles;  

   

   

    public Delaunay() {  

        vertices = new CopyOnWriteArrayList<PVector>();  

        tetras = new CopyOnWriteArrayList<Tetrahedron>();  

        edges = new CopyOnWriteArrayList<Line>();  

        surfaceEdges = new CopyOnWriteArrayList<Line>();  

        triangles = new CopyOnWriteArrayList<Triangle>();  

    }  

   

    public void SetData(List<PVector> seq) {  

   

        tetras.clear();  

        edges.clear();  

   

        // 1    : 点群を包含する四面体を求める  

        //   1-1: 点群を包含する球を求める  

        PVector vMax = new PVector(-999, -999, -999);  

        PVector vMin = new PVector( 999,  999,  999);  

        for(PVector v : seq) {  

            if (vMax.x < v.x) vMax.x = v.x;  

            if (vMax.y < v.y) vMax.y = v.y;  

            if (vMax.z < v.z) vMax.z = v.z;  

            if (vMin.x > v.x) vMin.x = v.x;  

            if (vMin.y > v.y) vMin.y = v.y;  

            if (vMin.z > v.z) vMin.z = v.z;  

        }  

   

        PVector center = new PVector();     // 外接球の中心座標  

        center.x = 0.5f * (vMax.x - vMin.x);  

        center.y = 0.5f * (vMax.y - vMin.y);  

        center.z = 0.5f * (vMax.z - vMin.z);  

        float r = -1;                       // 半径  

        for(PVector v : seq) {  

            if (r < PVector.dist(center, v)) r = PVector.dist(center, v);  

        }  

        r += 0.1f;                          // ちょっとおまけ  

   

        //   1-2: 球に外接する四面体を求める  

        PVector v1 = new PVector();  

        v1.x = center.x;  

        v1.y = center.y + 3.0f*r;  

        v1.z = center.z;  

   

        PVector v2 = new PVector();  

        v2.x = center.x - 2.0f*(float)Math.sqrt(2)*r;  

        v2.y = center.y - r;  

        v2.z = center.z;  

   

        PVector v3 = new PVector();  

        v3.x = center.x + (float)Math.sqrt(2)*r;  

        v3.y = center.y - r;  

        v3.z = center.z + (float)Math.sqrt(6)*r;  

   

        PVector v4 = new PVector();  

        v4.x = center.x + (float)Math.sqrt(2)*r;  

        v4.y = center.y - r;  

        v4.z = center.z - (float)Math.sqrt(6)*r;  

   

        PVector[] outer = {v1, v2, v3, v4};  

        tetras.add(new Tetrahedron(v1, v2, v3, v4));  

   

        // 幾何形状を動的に変化させるための一時リスト  

        ArrayList<Tetrahedron> tmpTList = new ArrayList<Tetrahedron>();  

        ArrayList<Tetrahedron> newTList = new ArrayList<Tetrahedron>();  

        ArrayList<Tetrahedron> removeTList = new ArrayList<Tetrahedron>();  

        for(PVector v : seq) {  

            tmpTList.clear();  

            newTList.clear();  

            removeTList.clear();  

            for (Tetrahedron t : tetras) {  

                if((t.o != null) && (t.r > PVector.dist(v, t.o))) {  

                    tmpTList.add(t);  

                }  

            }  

   

            for (Tetrahedron t1 : tmpTList) {  

                // まずそれらを削除  

                tetras.remove(t1);  

   

                v1 = t1.vertices[0];  

                v2 = t1.vertices[1];  

                v3 = t1.vertices[2];  

                v4 = t1.vertices[3];  

                newTList.add(new Tetrahedron(v1, v2, v3, v));  

                newTList.add(new Tetrahedron(v1, v2, v4, v));  

                newTList.add(new Tetrahedron(v1, v3, v4, v));  

                newTList.add(new Tetrahedron(v2, v3, v4, v));  

            }  

   

            boolean[] isRedundancy = new boolean[newTList.size()];  

            for (int i = 0; i < isRedundancy.length; i++) isRedundancy[i] = false;  

            for (int i = 0; i < newTList.size()-1; i++) {  

                for (int j = i+1; j < newTList.size(); j++) {  

                    if(newTList.get(i).equals(newTList.get(j))) {  

                        isRedundancy[i] = isRedundancy[j] = true;  

                    }  

                }  

            }  

            for (int i = 0; i < isRedundancy.length; i++) {  

                if (!isRedundancy[i]) {  

                    tetras.add(newTList.get(i));  

                }  

   

            }  

               

        }  

   

           

        boolean isOuter = false;  

        for (Tetrahedron t4 : tetras) {  

            isOuter = false;  

            for (PVector p1 : t4.vertices) {  

                for (PVector p2 : outer) {  

                    if (p1.x == p2.x && p1.y == p2.y && p1.z == p2.z) {  

                        isOuter = true;  

                    }  

                }  

            }  

            if (isOuter) {  

                tetras.remove(t4);  

            }  

        }  

   

        triangles.clear();  

        boolean isSame = false;  

        for (Tetrahedron t : tetras) {  

            for (Line l1 : t.getLines()) {  

                isSame = false;  

                for (Line l2 : edges) {  

                    if (l2.equals(l1)) {  

                        isSame = true;  

                        break;  

                    }  

                }  

                if (!isSame) {  

                    edges.add(l1);  

                }  

            }  

        }  

   

        // ===  

        // 面を求める  

          

        ArrayList<Triangle> triList = new ArrayList<Triangle>();  

        for (Tetrahedron t : tetras) {  

            v1 = t.vertices[0];  

            v2 = t.vertices[1];  

            v3 = t.vertices[2];  

            v4 = t.vertices[3];  

   

            Triangle tri1 = new Triangle(v1, v2, v3);  

            Triangle tri2 = new Triangle(v1, v3, v4);  

            Triangle tri3 = new Triangle(v1, v4, v2);  

            Triangle tri4 = new Triangle(v4, v3, v2);  

   

            PVector n;  

            // 面の向きを決める  

            n = tri1.getNormal();  

            if(n.dot(v1) > n.dot(v4)) tri1.turnBack();  

   

            n = tri2.getNormal();  

            if(n.dot(v1) > n.dot(v2)) tri2.turnBack();  

   

            n = tri3.getNormal();  

            if(n.dot(v1) > n.dot(v3)) tri3.turnBack();  

   

            n = tri4.getNormal();  

            if(n.dot(v2) > n.dot(v1)) tri4.turnBack();  

   

            triList.add(tri1);  

            triList.add(tri2);  

            triList.add(tri3);  

            triList.add(tri4);  

        }  

        boolean[] isSameTriangle = new boolean[triList.size()];  

        for(int i = 0; i < triList.size()-1; i++) {  

            for(int j = i+1; j < triList.size(); j++) {  

                if (triList.get(i).equals(triList.get(j))) isSameTriangle[i] = isSameTriangle[j] = true;  

            }  

        }  

        for(int i = 0; i < isSameTriangle.length; i++) {  

            if (!isSameTriangle[i]) triangles.add(triList.get(i));  

        }  

   

        surfaceEdges.clear();  

        ArrayList<Line> surfaceEdgeList = new ArrayList<Line>();  

        for(Triangle tri : triangles) {  

            surfaceEdgeList.addAll(Arrays.asList(tri.getLines()));  

        }  

        boolean[] isRedundancy = new boolean[surfaceEdgeList.size()];  

        for(int i = 0; i < surfaceEdgeList.size()-1; i++) {  

            for (int j = i+1; j < surfaceEdgeList.size(); j++) {  

                if (surfaceEdgeList.get(i).equals(surfaceEdgeList.get(j))) isRedundancy[j] = true;  

            }  

        }  

   

        for (int i = 0; i < isRedundancy.length; i++) {  

            if (!isRedundancy[i]) surfaceEdges.add(surfaceEdgeList.get(i));  

        }  

           

    }
