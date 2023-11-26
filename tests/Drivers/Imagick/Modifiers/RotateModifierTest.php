<?php

namespace Intervention\Image\Tests\Drivers\Imagick\Modifiers;

use Intervention\Image\Modifiers\RotateModifier;
use Intervention\Image\Tests\TestCase;
use Intervention\Image\Tests\Traits\CanCreateImagickTestImage;

/**
 * @requires extension imagick
 * @covers \Intervention\Image\Modifiers\RotateModifier
 */
class RotateModifierTest extends TestCase
{
    use CanCreateImagickTestImage;

    public function testRotate(): void
    {
        $image = $this->createTestImage('test.jpg');
        $this->assertEquals(320, $image->width());
        $this->assertEquals(240, $image->height());
        $image->modify(new RotateModifier(90, 'fff'));
        $this->assertEquals(240, $image->width());
        $this->assertEquals(320, $image->height());
    }
}