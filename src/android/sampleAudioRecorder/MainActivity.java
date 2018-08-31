//package com.example.administrator.sampleaudiorecorder;
//
//import android.app.Activity;
//import android.media.MediaPlayer;
//import android.media.MediaRecorder;
//import android.os.Bundle;
//import android.util.Log;
//import android.view.View;
//import android.widget.Button;
//import android.widget.Toast;
//
//public class MainActivity extends Activity {
//    final private static String RECORDED_FILE = "/sdcard/Download/recorded.mp4";
//
//    MediaPlayer player;
//    MediaRecorder recorder;
//
//    @Override
//    protected void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_main);
//
//        Button recordBtn = (Button)findViewById(R.id.recordBtn);
//        Button recordStopBtn = (Button)findViewById(R.id.recordStopBtn);
//        Button playBtn = (Button)findViewById(R.id.playBtn);
//        Button playStopBtn = (Button)findViewById(R.id.playStopBtn);
//
//        recordBtn.setOnClickListener(new View.OnClickListener(){
//            @Override
//            public void onClick(View v) {
//                if(recorder != null){
//                    recorder.stop();
//                    recorder.release();
//                    recorder = null;
//                }
//
//                recorder = new MediaRecorder();
//
//                recorder.setAudioSource(MediaRecorder.AudioSource.MIC);
//                recorder.setOutputFormat(MediaRecorder.OutputFormat.MPEG_4);
//                recorder.setAudioEncoder(MediaRecorder.AudioEncoder.DEFAULT);
//
//                recorder.setOutputFile(RECORDED_FILE);
//
//                try{
//                    Toast.makeText(getApplicationContext(),"오디오 녹음 시작",Toast.LENGTH_SHORT).show();
//
//                    recorder.prepare();
//                    recorder.start();
//                }catch(Exception ex){
//                    Log.e("SampleAudioRecorder","Exception : ",ex);
//                }
//            }
//        });
//
//        recordStopBtn.setOnClickListener(new View.OnClickListener(){
//            @Override
//            public void onClick(View v) {
//                if(recorder==null){
//                    return;
//                }
//                recorder.stop();
//                recorder.release();
//                recorder = null;
//
//                Toast.makeText(getApplicationContext(),"오디오 녹음 중지",Toast.LENGTH_SHORT).show();
//            }
//        });
//
//        playBtn.setOnClickListener(new View.OnClickListener(){
//            @Override
//            public void onClick(View v) {
//                if (player != null) {
//                    player.stop();
//                    player.release();
//                    player = null;
//                }
//
//                Toast.makeText(getApplicationContext(), "오디오 재생 시작.", Toast.LENGTH_LONG).show();
//                try{
//                    player = new MediaPlayer();
//
//                    player.setDataSource(RECORDED_FILE);
//                    player.prepare();
//                    player.start();
//                }catch(Exception e){
//                    Log.e("SampleAudioRecorder", "Audio play failed.", e);
//                }
//            }
//        });
//
//        playStopBtn.setOnClickListener(new View.OnClickListener(){
//            @Override
//            public void onClick(View v) {
//                if(player == null){
//                    return;
//                }
//
//                Toast.makeText(getApplicationContext(),"오디오 재생 중지",Toast.LENGTH_SHORT).show();
//
//                player.stop();
//                player.release();
//                player = null;
//            }
//        });
//    }
//
//    protected void onPause(){
//        if(recorder!=null){
//            recorder.release();
//            recorder = null;
//        }
//
//        if(player!=null){
//            player.release();
//            player=null;
//        }
//
//        super.onPause();
//    }
//}
