.global led2_on
led2_on:
	ldr	r11, =0xE0200284
	ldr	r12, [r11]
	bic	r12, r12, #1
	str	r12, [r11]
	mov	pc, lr

.global lowlevel_init
lowlevel_init:
	ldr r0, =0xE2900000
	ldr r1, =3

	str r1, [r0]	@ULCON0=3
