// Copyright 2013 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

package org.chromium.ui.autofill;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.graphics.PixelFormat;

public class AutofillDividerDrawable extends Drawable {

    private Paint mPaint;
    private Rect mDividerRect;

    public AutofillDividerDrawable() {
        mPaint = new Paint();
        mDividerRect = new Rect();
    }

    @Override
    public void draw(Canvas canvas) {
        canvas.drawRect(mDividerRect, mPaint);
    }

    @Override
    public void onBoundsChange(Rect bounds) {
        mDividerRect.set(0, 0, bounds.width(), mDividerRect.height());
    }

    public void setHeight(int height) {
        mDividerRect.set(0, 0, mDividerRect.right, height);
    }

    public void setColor(int color) {
        mPaint.setColor(color);
    }

    @Override
    public void setAlpha(int alpha) {
    }

    @Override
    public void setColorFilter(ColorFilter cf) {
    }

    @Override
    public int getOpacity() {
        return PixelFormat.OPAQUE;
    }
}
