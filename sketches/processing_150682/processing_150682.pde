
class quaternion
{

    float _w;
    PVector _u;
    
    quaternion()
    {
      _u = new PVector();
      makeIdentity(); 
    };
    
    quaternion(float w,float u1, float u2, float u3) 
    {
     _w = w;
     _u = new PVector(u1,u2,u3);
    };
 
    quaternion(float ang, PVector eje)
    {
        _w = cos(ang*0.5);
        _u = PVector.mult(eje, sin(ang*0.5)*(1.0/eje.mag()));
    };
     
    void makeIdentity()
    {
        _w = 1.0f;
        _u.x = 0.0f;
        _u.y = 0.0f;
        _u.z = 0.0f;
         
    };
     
    void normalize()
    {
        float norm = sqrt(_w*_w + _u.x*_u.x + _u.y*_u.y + _u.z*_u.z);
        _w /= norm;
        _u.div(norm); // *= (1.0)/norm;
    }
     
    quaternion inv(){
        return new quaternion( _w, -_u.x, -_u.y, -_u.z);
    };
     
    PVector rotate(PVector v)
    {
        return (inv().mult(v))._u;
    }
    
    PMatrix3D getMatrix()
    {
      PMatrix3D m = new PMatrix3D (1-2*(_u.y*_u.y) - 2*(_u.z*_u.z),  2*_u.x*_u.y - 2*_u.z*_w        ,           2*_u.x*_u.z + 2*_u.y*_w, 0,
                                  2*_u.x*_u.y + 2*_u.z*_w         ,  1-2*(_u.x*_u.x) - 2*(_u.z*_u.z),     2*_u.y*_u.z - 2*_u.x*_w, 0,
                                  2*_u.x*_u.z - 2*_u.y*_w         ,  2*_u.y*_u.z + 2*_u.x*_w        , 1-2*(_u.x*_u.x) - 2*(_u.y*_u.y), 0,
                                  0, 0, 0, 1);
                                  
       return m;
    }
 
     PMatrix3D rotate(PMatrix3D m1)
    {
        
      
        PMatrix3D me = getMatrix();
        PMatrix3D met = me;
        met.transpose();
        PMatrix3D m2 = m1;
        m2.apply(met);
        m2.preApply(me);
        return m2;
    }
 
     
    PVector getAxis()
    {
        normalize();
        float out_angle = 2*acos(_w);
        PVector out_dir = PVector.mult(_u, 1/sin(out_angle*0.5));
        return out_dir;
    }
    
    float getAngle()
    {
        normalize();
        float out_angle = 2*acos(_w);
        return out_angle;
    }
    
     
    void add(quaternion q2)
    {
      _w += q2._w; 
      _u.x+= q2._u.x; 
      _u.y+= q2._u.y;
      _u.z+= q2._u.z;    
    }
     
    quaternion mult(quaternion q2)
    {
        quaternion qres = new quaternion(); 
        quaternion q1 = new quaternion(_w, _u.x, _u.y, _u.z);
        qres._w = q1._w*q2._w - q1._u.dot(q2._u);
        qres._u = PVector.add(PVector.mult(q1._u, q2._w), PVector.mult(q2._u, q1._w)); 
        qres._u.add(q1._u.cross(PVector.mult(q2._u, -1.0f)));
        return qres;
    }
//     
    quaternion mult(PVector v)
    {
        quaternion q_aux = new quaternion();
        q_aux._w = 0.0f;
        q_aux._u = v;
        return mult(q_aux);
    }
     
    void mult(float x)
    {
      _w *= x; 
      _u.x*= x; 
      _u.y*= x;
      _u.z*= x;     
        
    }
     
     
//    friend inline Quaternion operator*(const Vector3D &v,const Quaternion &q)
//    {
//        Quaternion q_aux;
//        q_aux._w = 0.0f;
//        q_aux._u = v;
//        return q_aux*q;    
//    }
     
 

};
 

