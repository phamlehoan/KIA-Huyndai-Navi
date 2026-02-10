package com.mnsoft.navi;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Toast;

public class NaviApp extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Intent i = getPackageManager().getLaunchIntentForPackage("com.phamlehoan.gnavipro");

        if (i != null) {
            i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
            startActivity(i);
        } else {
            Toast.makeText(this, "Chưa tìm thấy G-Navi Pro. Vui lòng cài đặt ứng dụng chính!", Toast.LENGTH_LONG).show();
        }
        finish();
    }
}
