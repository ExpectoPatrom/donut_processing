class z_buffer{
  float[][] buffer_matrix;

  z_buffer(int m, int n){
    buffer_matrix = new float[m][n];
    for(int i=0; i<m; i+=1){
      for(int j=0; j<n; j++){
        buffer_matrix[i][j] = 90;
      }
    }
  }
}
