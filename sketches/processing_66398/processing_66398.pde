
public class Edge implements Comparable
{
    private final Vertex vertexA;
    private final Vertex vertexB;

    private final float length;

    public Edge(Vertex a, Vertex b) {
        vertexA = a;
        vertexB = b;
        PVector pVectorA = vertexA.getPVector();
        PVector pVectorB = vertexB.getPVector();
        length = Math.abs(pVectorA.dist(pVectorB));
    }

    public Vertex getVertexA()
    {
        return vertexA;
    }

    public Vertex getVertexB()
    {
        return vertexB;
    }

    public float getLength()
    {
        return length;
    }

    public int compareTo(Object o)
    {
        Edge otherEdge = (Edge) o;
        if(this.getLength() < otherEdge.getLength()) {
            return -1;
        }
        else if(this.getLength() > otherEdge.getLength()) {
            return 1;
        }
        else {
            return 0;
        }
    }

}

