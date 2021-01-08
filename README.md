# Tapdaq plugin for Godot engine.

Register an account in Tapdaq https://www.tapdaq.com before using this module.

## Installation

Use [NativeLib Addon](https://github.com/DrMoriarty/nativelib) or [NativeLib-CLI](https://github.com/DrMoriarty/nativelib-cli) for installation.

## Adapters

The core module has only SDK for Tapdaq mediation. For using any ad networks you should install specific adapters. For example install `tapdaq-fan` for Facebook Audience Network.

## Usage

Wrapper on gd-script will be in your autoloading list. Use global name `tapdaq` anywhere in your code to use API.

## API

### loadBanner(id: String, isTop: bool, callback_id: int)

Load banner with specific zone ID. `callback_id` is instance_id from callback object.

### loadInterstitial(id: String, callback_id: int)

Load interstitial with specific zone ID. `callback_id` is instance_id from callback object.

### loadRewardedVideo(id: String, callback_id: int)

Load rewarded ad with specific zone ID. `callback_id` is instance_id from callback object.

### bannerWidth(id: String) -> int

Returns current banner width. Returns 0 if there are no active banners.

### bannerHeight(id: String) -> int

Returns current banner height. Returns 0 if there are no active banners.

### showBanner(id: String)

Show banner with specific zone ID. The banner must be loaded before this call.

### hideBanner(id: String)

Hide banner with specific zone ID.

### removeBanner(id: String)

Completely remove banner view from the screen.

### showInterstitial(id: String)

Show interstitial with specific zone ID. The interstitial must be loaded before call.

### showRewardedVideo(id: String)

Show rewarded video ad with specific zone ID. The rewarded ad must be loaded before call.

## Callbacks

When load ad you specified instance_id of callback object. This object can have methods to get callbacks from the SDK.

### Rewarded video callbacks

_on_rewarded_video_ad_loaded(id: String)

_on_rewarded_video_ad_failed_to_load(id: String, error: String)

_on_rewarded_video_ad_opened(id: String)

_on_rewarded_video_ad_left_application(id: String)

_on_rewarded_video_ad_closed(id: String)

_on_rewarded_video_started(id: String)

_on_rewarded_video_completed(id: String)

_on_rewarded(id: String, reward: String, amount: int)

### Banner callbacks

_on_banner_loaded(id: String)

_on_banner_failed_to_load(id: String)

_on_banner_failed_to_load(id: String, error: String)

_on_banner_shown(id: String)

### Interstitial callbacks

_on_interstitial_loaded(id: String)

_on_interstitial_failed_to_load(id: String, error: String)

_on_interstitial_close(id: String)
