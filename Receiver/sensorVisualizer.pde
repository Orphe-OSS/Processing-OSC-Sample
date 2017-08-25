
class sensorVisualizer{
  
  float[] quat = new float[4];
  float[] angle = new float[3];
  float[] acc = new float[3];
  float[] gyro = new float[3];
  float compass = 0;
  float shock = 0;
  float[] gravity = new float[3];
  int x0, y0;
  
  sensorVisualizer(int x, int y){
    x0 = x; y0 = y;
  }
  
  void display(){
    
    translate(x0, y0);
    
    int index = 0;
    int rectW = 10;
    int halfH = width/2;
    
    fill(255);
    for(int i = 0;  i < 4; i++){
      ellipse(index*rectW, width-(quat[i]+1)*halfH, rectW, rectW);
      index++;
    }
    
    fill(255,0,0);
    for(int i = 0;  i < 3; i++){
      ellipse(index*rectW, width-(angle[i]+1)*halfH, rectW, rectW);
      index++;
    }
    
    fill(255,255,0);
    for(int i = 0;  i < 3; i++){
      ellipse(index*rectW, width-(acc[i]+1)*halfH, rectW, rectW);
      index++;
    }
    
    fill(0,255,255);
    for(int i = 0;  i < 3; i++){
      ellipse(index*rectW, width-(gyro[i]+1)*halfH, rectW, rectW);
      index++;
    }
    
    fill(255,0,255);
    ellipse(index*rectW, width-(compass+1)*halfH, rectW, rectW);
    index++;

    fill(0,255,0);
    ellipse(index*rectW, width-(shock+1)*halfH, rectW, rectW);
    index++;
    
    fill(100);
    for(int i = 0;  i < 3; i++){
      ellipse(index*rectW, width-(gravity[i]+1)*halfH, rectW, rectW);
      index++;
    }
  }
  
  void setOscMessage(OscMessage theOscMessage){
    int index = 0;
    for(int i = 0; i < 4; i++){
      quat[index] = theOscMessage.get(index).floatValue();
      index++;
    }
    
    for(int i = 0; i < 3; i++){
      angle[i] = theOscMessage.get(index).floatValue()/180.0;
      index++;
    }
    
    for(int i = 0; i < 3; i++){
      acc[i] = theOscMessage.get(index).floatValue();
      index++;
    }
    
    for(int i = 0; i < 3; i++){
      gyro[i] = theOscMessage.get(index).floatValue();
      index++;
    }
    
    compass = theOscMessage.get(index).floatValue()/360.0;
    index++;
    
    shock  = theOscMessage.get(index).floatValue()/255.0;
    index++;
    
    for(int i = 0; i < 3; i++){
      gravity[i] = theOscMessage.get(index).floatValue();
      index++;
    }
  }
}