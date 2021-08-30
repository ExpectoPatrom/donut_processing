class point_3D{
  float _x;
  float _y;
  float _z;
  float _k1 = 50;
  float _k2 = 105;
  float x_2d;
  float y_2d;
  float z_2d;
  point_3D(float x, float y, float z){
    _x = x;
    _y = y;
    _z = z;
    x_2d = coord_to_2d(_x);
    y_2d = coord_to_2d(_y);
    z_2d = coord_to_2d(_z);
  }
  float coord_to_2d(float coor){
    return (_k1*coor)/(_k2+_z);
  }
}
